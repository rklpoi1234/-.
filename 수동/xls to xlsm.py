import win32com.client as win32
import os

fname = '주문목록2023-07-18.xls'
new_fname = os.path.splitext(fname)[0] + ".xlsx"

excel = win32.gencache.EnsureDispatch('Excel.Application')
wb = excel.Workbooks.Open(os.path.abspath(fname))

wb.SaveAs(os.path.abspath(new_fname), FileFormat=51)
wb.Close()
excel.Application.Quit()