package sist.co.help;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import au.com.bytecode.opencsv.CSVWriter;

public class CSVWrite {

	private String filename = "D:/Spring/finalProject160203/WebContent/data/test3.csv";

	public CSVWrite() {
	}

	public void writeCsv(List<String[]> data) {
		try {
			CSVWriter cw = new CSVWriter(new FileWriter(new File("C:/Users/RyuDung/Desktop/study_jsp/eclipse/finalProject160222/WebContent/data/test3.csv")), ',', '"');
			Iterator<String[]> it = data.iterator();
			try {
//				while (it.hasNext()) {
//					String[] s = (String[]) it.next();
//					cw.writeNext(s);
//					
//				}
				cw.writeAll(data);
			} finally {
				cw.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void insertGuPopulation(List<String[]> dataAll, int[] guPopulation) {
		String[] tmp = new String[25]; 
		for(int i=0; i<25; i++){//string 배열로 변환
			tmp[i]=String.valueOf(guPopulation[i]);
		}
		for(int j=0; j<3;j++){
			for(int i=0; i<25; i++){//전체 인구를 바꾸기
				String[] str=dataAll.get((i+(j*25))+1);
				//System.out.println((i+(j*25))+1);
				str[5]= tmp[i];

				dataAll.set((i+(j*25))+1, str);
			
			}
		}
	}

	public void insertEachData(List<String[]> dataAll,
			int[] highRankPopulation, int[] midRankPopulation,
			int[] lowRankPopulation) {
		String[] highTmp = new String[25]; 
		for(int i=0; i<25; i++){//string 배열로 변환
			highTmp[i]=String.valueOf(highRankPopulation[i]);
		}
		String[] midTmp = new String[25]; 
		for(int i=0; i<25; i++){//string 배열로 변환
			midTmp[i]=String.valueOf(midRankPopulation[i]);
		}
		String[] lowTmp = new String[25]; 
		for(int i=0; i<25; i++){//string 배열로 변환
			lowTmp[i]=String.valueOf(lowRankPopulation[i]);
		}
		
		for(int i=0; i<25; i++){//전체 인구를 바꾸기
			String[] str1=dataAll.get(i+1);
			String[] str2=dataAll.get(i+1+25);
			String[] str3=dataAll.get(i+1+50);

			str1[3]= highTmp[i];
			str2[3]= lowTmp[i];
			str3[3]= midTmp[i];

			dataAll.set(i+1, str1);
			dataAll.set(i+1+25, str2);
			dataAll.set(i+1+50, str3);
			
		}
	}

	public void insertRank(List<String[]> dataAll, int[] rankPopulation) {
		
	}
}