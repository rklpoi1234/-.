import os
import tkinter as tk
import pandas as pd
import win32com.client
import datetime
from tkinter import filedialog, Label, Entry, Button, StringVar, messagebox
from shutil import copy2

allowed_orders = []

order_type_mapping = {
    '관리자(액자)': 'AdminClaim', '베젤': 'Bezel', '아뜨레앨범': 'attreAlbum', '베네핏': 'Benefit','네이쳐': 'Nature'
   , '베네핏멀티': 'BenefitMulti', '베네핏화이트': 'BenefitWhite', '비트로': 'Bitro', '끌레르': 'Clair',
    '끌레르CD케이스': 'ClairCDCase', '네이쳐아크': 'NatureArc', '뉴욕갤러리': 'NWGallery',
    '모던우드': 'Modernwood', '밀키': 'Milky', '프라임우드': 'Primewood', '프리즘': 'Prism', '스페셜베젤': 'SpecialBezel',
    '틴케이': 'TinK', '유니크아크': 'UniqueArc', '갤럭시': 'Galaxy', '지아크': 'GArc'
    # 여기에 추가적인 매핑 정보를 추가할 수 있습니다.
}

def main(): #파이썬 GUI폼 수정
    window = tk.Tk()
    window.title("DPCS일본파일 복사 자동화")

    global time_str
    time_str = StringVar()

    file_label = Label(window, text="File Address:")
    file_label.grid(row=0, column=0)

    file_path = StringVar()
    file_entry = Entry(window, textvariable=file_path, width=50)
    file_entry.grid(row=0, column=1)
    
    date_label = Label(window, text="무조건 접수 시간을 입력해주십시오 # 2023-07-10 by 출력실 김윤기")
    date_label.grid(row=2, column=2, sticky="e")  # 오른쪽 하단에 배치하기 위해 
    
    time_label = Label(window, text="10:51 이런형식으로 그 시간 이후로 당겨옵니다.")
    time_label.grid(row=2, column=1)
    
    time_entry = Entry(window, textvariable=time_str, width=10)
    time_entry.grid(row=1, column=1)

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
    file_convert_button.grid(row=1, column=2, columnspan=3)

    browse_button = Button(window, text="Browse", command=browse_button)
    browse_button.grid(row=0, column=2)

    button1 = Button(window, text="일본 실행", width=15, command=lambda: execute_process(file_path.get(), "일본",time_str.get()))
    button1.grid(row=1, column=0)

    window.mainloop()

def execute_process(excel_file: str, option: str,user_time: str): 
    #프로세스
    #액자가 달라지거나 수정이필요할시 []배열안에 추가,변경바람
    global allowed_orders
    user_date = datetime.datetime.strptime(user_time, "%H:%M").time()
    
    if option == "일본":
        allowed_orders = ['AdminClaim','attreAlbum','Benefit','BenefitMulti','BenefitWhite','Bezel','Bitro','Clair','ClairCDCase','Nature','NatureArc','NWGallery','Mordernwood','Milky','Primewood','Prism','SpecialBezel','TinK','UniqueArc','Galaxy','GArc']
        messagebox.showinfo("알림", "일본껀 주문 취소 제외가 안되기 때문에 DPCS 내 확인 바랍니다.")
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
    filtered_df = df.loc[(df["다운로드"]==1) & (df["다운로드1"]==1) & (~df['item'].str.contains('디자인 의뢰 있음', na=False))].copy()
    #출고예정일 현재날짜랑 비교후 1이나오면 "기타" 0일시 "당일" 나머지는 그대로 
    #filtered_df["due_date_diff"] = (pd.to_datetime(filtered_df["출고예정"]) - pd.to_datetime('today')).dt.days

    #엑셀의 날짜부 추출 '주문목록2023-05-23 이면 2023-05-23부 추출
    excel_date = excel_file.split('\\')[-1].split('.')[0][-10:]

    today = datetime.date.today()
    tomorrow = today + datetime.timedelta(days=1)

    for index, row in filtered_df.iterrows():

        order_date = pd.to_datetime(row["접수일자"]).time()
        if order_date < user_date: 
            continue

        print(f"Order type mapping: {order_type_mapping.get(row['주문종류'], row['주문종류'])}")
        order_type = order_type_mapping.get(row["주문종류"], row["주문종류"]) #order_type에 주문종류행을 돌면서 찾는다
        print(f"Order_type: {order_type}")
        # if order_type not in allowed_orders:
        #     continue

        due_date = pd.to_datetime(row["출고예정"]).date()
        if due_date == today:
            target_sub_folder = "당일"
        elif due_date == tomorrow:
            target_sub_folder = "기타"
        else:
            target_sub_folder = ""

        order_no = str(row['주문번호']) #주문번호 획득
        # 소스 폴더를 영어 주문종류로 설정 #일본 다운 폴더 주소를 입력해주세요
        source_folder = os.path.join(r"C:/Users/whoami/Desktop/1차,2차,일본당겨오기스크립트/실험용", excel_date, order_type)
        
        print(source_folder)
        if target_sub_folder in ["당일", "기타"]:
            # 소스 폴더를 영어 주문종류로 설정
            target_folder = os.path.join(r"C:\아크릴작업", target_sub_folder, order_type)
        else:
            target_folder = os.path.join(r"C:\아크릴작업", order_type)
        
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