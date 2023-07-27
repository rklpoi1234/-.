import os
import tkinter as tk
import pandas as pd
import win32com.client
import datetime
import re
from tkinter import filedialog, Label, Entry, Button, StringVar, messagebox
from shutil import copy2

allowed_orders = []


def main(): #파이썬 GUI폼 수정
    window = tk.Tk()
    window.title("DPCS파일 복사 자동화")

    file_label = Label(window, text="File Address:")
    file_label.grid(row=0, column=0)

    file_path = StringVar()
    file_entry = Entry(window, textvariable=file_path, width=50)
    file_entry.grid(row=0, column=1)
    
    date_label = Label(window, text="# 2023-07-10 by 출력실 김윤기")
    date_label.grid(row=2, column=2, sticky="e")  # 오른쪽 하단에 배치하기 위해 

    def browse_button():
        filename = filedialog.askopenfilename(title="Select a file", filetypes=(("Microsoft Excel Worksheet", "*.xlsx"),))
        file_path.set(filename)

    def choose_excel_file():
        filename = filedialog.askopenfilename(
            title="변환할 xls 파일 선택", filetypes=(("Microsoft Excel Worksheet", "*.xls"),))
        if filename:
            save_xls_to_xlsx(filename)

    

#xls to xlsx 부분은 건들지마세요!
    def save_xls_to_xlsx(file_path):
        #파일경로 재수정
        file_path = file_path.replace("/", "\\")
        file_path = file_path.replace(",", "_")
        print('File path:', file_path) #디버그용
    # Set the proper file name and check if it is already in the xlsx format
        input_filename, extension = os.path.splitext(file_path)
        if extension.lower() == ".xlsx":
            return

        output_filename = input_filename + ".xlsx"
        
        excel = None
        try:
            excel = win32com.client.Dispatch('Excel.Application')
            excel.Visible = False
            wb = excel.Workbooks.Open(file_path)
            wb.SaveAs(output_filename, FileFormat=51)
            wb.Close(False)
        except Exception as e:
            if excel:
                excel.Application.Quit()
                excel = None
            raise e
        finally:
            if excel:
                excel.Application.Quit()
                excel = None

        return output_filename

    file_convert_button = tk.Button(window, text="XLS to XLSX", width=15, command=choose_excel_file)
    file_convert_button.grid(row=1, column=0, columnspan=3)

    browse_button = Button(window, text="Browse", command=browse_button)
    browse_button.grid(row=0, column=2)

    button1 = Button(window, text="1차 실행", width=15, command=lambda: execute_process(file_path.get(), "1차"))
    button1.grid(row=1, column=0)
    button2 = Button(window, text="2차 실행", width=15, command=lambda: execute_process(file_path.get(), "2차"))
    button2.grid(row=1, column=2)

    window.mainloop()

def execute_process(excel_file: str, option: str): 
    #프로세스
    #액자가 달라지거나 수정이필요할시 []배열안에 추가,변경바람
    global allowed_orders
    # '602(마트)4번' 가타은염제외
    classification_conditions = ['604(라미)5번', '라미코팅', '우드끌레르', '마트'] #2차 은화지 은염할것들을 당일,기타로 따로 또 분류하기위해
    
    if option == "1차":
        allowed_orders = ['끌레르액자','N끌레르','기본액자','베이직액자','마틸스']
    elif option == "2차":
        allowed_orders = ['뉴욕갤러리','PAS','N디아섹','디아섹','빌리프우드','빌리프데코','프라임우드','프라임데코','캔버스액자','캔버스(무광)액자','메탈라인','원목액자','모던우드','패브릭데코','루이','빌트랩','아트플러스','프리즘','프리모(마트)','엣지우드','파인아트','이태리(골드)','이태리(화이트)','블랙갤러리','감성사진관']
    else:
        print("올바르지 않은 옵션입니다.")
        return
    
    # 엑셀파일을 읽습니다. 엑셀파일은 .xlsx 으로 변경해서 읽어야됩니다.
    try:
        df = pd.read_excel(excel_file)
    except FileNotFoundError:
        print("DPCS내 엑셀을 알려주십시오")
        return

    #열 공백제거
    df.columns = df.columns.str.strip()
    #엑셀 필터링 조건식 주문취소=0 AND 접수증=0 AND 다운로드와다운로드1 가 1일때
    filtered_df = df.loc[(df["주문취소"]==0) & (df["접수증"]==0) & (df["다운로드"]==1) & (df["다운로드1"]==1)].copy()
    #출고예정일 현재날짜랑 비교후 1이나오면 "기타" 0일시 "당일" 나머지는 그대로 
    #filtered_df["due_date_diff"] = (pd.to_datetime(filtered_df["출고예정"]) - pd.to_datetime('today')).dt.days

    #엑셀의 날짜부 추출 '주문목록2023-05-23 이면 2023-05-23부 추출
    excel_date = excel_file.split('\\')[-1].split('.')[0][-10:]

    today = datetime.date.today()
    tomorrow = today + datetime.timedelta(days=1)

    for index, row in filtered_df.iterrows():
        #order_type = re.sub(r"\([^0]*\)","",order_type)
        order_type = row["주문종류"] #order_type에 주문종류행을 돌면서 찾는다

        if order_type not in allowed_orders:
            continue

        due_date = pd.to_datetime(row["출고예정"]).date()
        if option != '2차' or row['분류'] in classification_conditions:
            if due_date == today:
                target_sub_folder = "당일"
            elif due_date == tomorrow:
                target_sub_folder = "기타"
            else:
                target_sub_folder = ""
        else:
            target_sub_folder = ""

        
        order_no = str(row['주문번호']) #주문번호 획득
        order_no = re.sub(r"\s*\([^()]*\)", "", order_no) #주문번호에 괄호공백제거
        
        source_folder = os.path.join(r"\\arttre-down\tmp_client", excel_date, order_type)
        
        if target_sub_folder in ["당일", "기타"]:
            target_folder = os.path.join(r"E:\아크릴작업", target_sub_folder, order_type)
        else:
            target_folder = os.path.join(r"E:\아크릴작업", order_type)
        
        copy_files(source_folder, target_folder, order_no, row["출고예정"])

#파일복사
def copy_files(source_folder, target_folder, order_no, due_date):
    print(f"Source folder: {source_folder}") #디버그용
    print(f"Target folder: {target_folder}")
    print(f"Order_no: {order_no}")

    if not os.path.exists(source_folder):
        print(f"Source folder not found: {source_folder}")
        return

    for folder in os.listdir(source_folder):
        if order_no in folder:
            folder_path = os.path.join(source_folder, folder)
            new_target_folder = os.path.join(target_folder, folder)

            if not os.path.exists(new_target_folder):
                os.makedirs(new_target_folder)

            for root, dirs, files in os.walk(folder_path):
                for file in files:
                    print(f"Current file: {file}")
                    source_file = os.path.join(root, file)
                    print(f"Copying: {source_file} -> {os.path.join(new_target_folder, file)}")
                    copy2(source_file, new_target_folder)

if __name__ == "__main__":
    main()

# # 2023-07-21 by 출력실 김윤기