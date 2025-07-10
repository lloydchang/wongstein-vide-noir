# fix_notebook_widgets.py
import nbformat

file_path = "Testing Hugging Face.ipynb"  # Replace with your file path
nb = nbformat.read(file_path, as_version=nbformat.NO_CONVERT)

if 'widgets' in nb['metadata']:
    print("Removing metadata.widgets...")
    del nb['metadata']['widgets']

nbformat.write(nb, file_path)
print("Notebook cleaned successfully.")
