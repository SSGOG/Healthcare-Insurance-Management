import mysql.connector
from mysql.connector import Error
import tkinter as tk
from tkinter import ttk, messagebox, simpledialog

# Establish connection to MySQL
def connect_to_database():
    try:
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="ShreSIT@23",
            database="HEALTHCARE"
        )
        if connection.is_connected():
            print("Connected to MySQL database.")
        return connection
    except Error as e:
        messagebox.showerror("Database Connection Error", str(e))
        return None

# Function to retrieve available stored functions, procedures, and views
def load_available_objects():
    cursor = connection.cursor()
    try:
        # Query to get names of stored procedures
        cursor.execute("SHOW PROCEDURE STATUS WHERE Db = 'HEALTHCARE';")
        procedures = [row[1] for row in cursor.fetchall()]

        # Query to get names of stored functions
        cursor.execute("SHOW FUNCTION STATUS WHERE Db = 'HEALTHCARE';")
        functions = [row[1] for row in cursor.fetchall()]

        # Query to get names of views
        cursor.execute("SHOW FULL TABLES IN HEALTHCARE WHERE Table_Type = 'VIEW';")
        views = [row[0] for row in cursor.fetchall()]

        # Update the listboxes in the GUI
        update_listbox(procedure_listbox, procedures)
        update_listbox(function_listbox, functions)
        update_listbox(view_listbox, views)
    except Error as e:
        messagebox.showerror("Load Error", f"Error loading stored objects: {e}")
    finally:
        cursor.close()

# Utility function to update listboxes with data
def update_listbox(listbox, items):
    listbox.delete(0, tk.END)  # Clear existing items
    for item in items:
        listbox.insert(tk.END, item)  # Insert each item into the listbox

# Function to retrieve and display data from any table or view
def display_data_from_table_or_view(table_name):
    cursor = connection.cursor()
    try:
        query = f"SELECT * FROM {table_name};"
        cursor.execute(query)
        rows = cursor.fetchall()
        columns = [col[0] for col in cursor.description]  # Get column headers
        update_treeview(columns, rows)
    except Error as e:
        messagebox.showerror("Query Error", f"Error fetching data from {table_name}: {e}")
    finally:
        cursor.close()

# Function to execute a stored procedure and display results
def execute_procedure():
    procedure_name = simpledialog.askstring("Procedure", "Enter procedure name:")
    if not procedure_name:
        return
    num_params = simpledialog.askinteger("Parameters", "Number of parameters:", minvalue=0)
    params = []
    for i in range(num_params):
        param = simpledialog.askstring("Parameter Input", f"Enter parameter {i + 1}:")
        params.append(param)

    cursor = connection.cursor()
    try:
        cursor.callproc(procedure_name, params)
        rows = []
        columns = []
        for result in cursor.stored_results():
            columns = [col[0] for col in result.description]
            rows = result.fetchall()
        update_treeview(columns, rows)
    except Error as e:
        messagebox.showerror("Procedure Error", f"Error executing procedure {procedure_name}: {e}")
    finally:
        cursor.close()

# Function to call a stored function and return the result
def call_stored_function():
    function_name = simpledialog.askstring("Function", "Enter function name:")
    if not function_name:
        return
    num_params = simpledialog.askinteger("Parameters", "Number of parameters:", minvalue=0)
    params = []
    for i in range(num_params):
        param = simpledialog.askstring("Parameter Input", f"Enter parameter {i + 1}:")
        params.append(param)

    cursor = connection.cursor()
    try:
        query = f"SELECT {function_name}({', '.join(['%s'] * len(params))})"
        cursor.execute(query, params)
        result = cursor.fetchone()[0]
        update_treeview(["Result"], [(result,)])
    except Error as e:
        messagebox.showerror("Function Error", f"Error calling function {function_name}: {e}")
    finally:
        cursor.close()

# Function to update Treeview with new data
def update_treeview(columns, rows):
    treeview.delete(*treeview.get_children())  # Clear existing data
    treeview["columns"] = columns  # Set columns in treeview
    for col in columns:
        treeview.heading(col, text=col)  # Set column heading
        treeview.column(col, anchor="center", width=100)

    for row in rows:
        treeview.insert("", tk.END, values=row)  # Insert each row

# Initialize and set up Tkinter window
def create_gui():
    root = tk.Tk()
    root.title("Healthcare Database Management")

    # Main Window Layout
    frame = tk.Frame(root)
    frame.pack(pady=10)

    # Table/View name entry
    table_label = tk.Label(frame, text="Enter Table or View Name:")
    table_label.grid(row=0, column=0, padx=5, pady=5)
    table_entry = tk.Entry(frame, width=30)
    table_entry.grid(row=0, column=1, padx=5, pady=5)

    # Buttons
    view_button = tk.Button(frame, text="Display Table/View", command=lambda: display_data_from_table_or_view(table_entry.get()))
    view_button.grid(row=0, column=2, padx=5, pady=5)

    procedure_button = tk.Button(root, text="Execute Stored Procedure", command=execute_procedure)
    procedure_button.pack(pady=5)

    function_button = tk.Button(root, text="Call Stored Function", command=call_stored_function)
    function_button.pack(pady=5)

    # Treeview for Result Display
    global treeview
    treeview = ttk.Treeview(root, show="headings")
    treeview.pack(pady=10, fill=tk.BOTH, expand=True)

    # Scrollbars for Treeview
    scrollbar_y = tk.Scrollbar(root, orient="vertical", command=treeview.yview)
    scrollbar_y.pack(side="right", fill="y")
    scrollbar_x = tk.Scrollbar(root, orient="horizontal", command=treeview.xview)
    scrollbar_x.pack(side="bottom", fill="x")
    treeview.configure(yscroll=scrollbar_y.set, xscroll=scrollbar_x.set)

    # Lists for Stored Procedures, Functions, and Views
    global procedure_listbox, function_listbox, view_listbox
    list_frame = tk.Frame(root)
    list_frame.pack(pady=10)

    tk.Label(list_frame, text="Stored Procedures:").grid(row=0, column=0)
    procedure_listbox = tk.Listbox(list_frame, height=6, width=30, exportselection=False)
    procedure_listbox.grid(row=1, column=0, padx=5, pady=5)

    tk.Label(list_frame, text="Stored Functions:").grid(row=0, column=1)
    function_listbox = tk.Listbox(list_frame, height=6, width=30, exportselection=False)
    function_listbox.grid(row=1, column=1, padx=5, pady=5)

    tk.Label(list_frame, text="Views:").grid(row=0, column=2)
    view_listbox = tk.Listbox(list_frame, height=6, width=30, exportselection=False)
    view_listbox.grid(row=1, column=2, padx=5, pady=5)

    # Exit button
    exit_button = tk.Button(root, text="Exit", command=root.quit)
    exit_button.pack(pady=5)

    # Load available objects into listboxes
    load_available_objects()

    root.mainloop()

# Main script
if __name__ == "__main__":
    connection = connect_to_database()
    if connection:
        create_gui()
        connection.close()
    else:
        messagebox.showerror("Error", "Failed to connect to the database.")
