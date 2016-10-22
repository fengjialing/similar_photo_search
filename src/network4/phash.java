package network4;
import java.awt.image.BufferedImage;
import java.awt.image.ColorModel;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.swing.JFileChooser;




public class phash {

	public static final int SAMEVALUE =1; 
	public static void main(String []args)
	{
		JFileChooser fd = new JFileChooser();  
		fd.showOpenDialog(null);  
	    File f = fd.getSelectedFile(); 
	    String hashCode;
		String sourceHashCode;
		if(f != null){
		String pic_url=f.getPath().substring(0,f.getPath().length());
		sourceHashCode=produceFingerPrint(pic_url);
		List urlList=collectionImgUrl();
		
		List hashCodes=new ArrayList();
		for (Object url : urlList) {
			hashCode = produceFingerPrint(url.toString());
			hashCodes.add(hashCode);
			}
		List similarResultList = new ArrayList();
		List differences = new ArrayList();
		for (int i = 0; i < hashCodes.size(); i++)
		{
			int difference = hammingDistance(sourceHashCode, hashCodes.get(i).toString());
			if(difference <= SAMEVALUE){
				System.out.println(difference);
				similarResultList.add(urlList.get(i).toString());
			}
		}
		System.out.println(similarResultList);
	}
  }

	public static String produceFingerPrint(String filename) {
		BufferedImage source = readImage(filename);// 读取文件
		int width = 32;
		int height = 32;
		int w_small=8;
		int h_small=8;
		int n=32;
		BufferedImage sourceImage=readImage(filename);
		int pic_w=sourceImage.getWidth();
		int pic_h=sourceImage.getHeight();
		int[] pixels = new int[width * height];
		
		int[] origin=new int[pic_w*pic_h];
		sourceImage.getRGB(0, 0, pic_w, pic_h,origin,0,pic_w); 
		int[] suoxiao=new int[width*height];
		suoxiao=shrink(origin, sourceImage.getWidth(), sourceImage.getHeight(), width, height);
		int[] gray=new int[width*height];
		gray=grayImage(suoxiao, width, height);
		Transformation pic=new Transformation();
		int[] afterDTC=new int[width*height];
		afterDTC=pic.DCT(gray, n);
		int afterEGray=averageGray(afterDTC,w_small, h_small);
		int[] comps = new int[w_small * h_small];
		for (int i = 0; i < comps.length; i++)
	   {
		if (afterDTC[i] >= afterEGray) {
		comps[i] = 1;
		} else {
		comps[i] = 0;
		}
	   }
		
		StringBuffer hashCode = new StringBuffer();
		for (int i = 0; i < comps.length; i += 4)
		{
		int result = comps[i] * (int) Math.pow(2, 3) + comps[i + 1]* (int) Math.pow(2, 2) + comps[i + 2] * (int) Math.pow(2, 1)+ comps[i + 2];
		hashCode.append(binaryToHex(result));
		} 
		return hashCode.toString();
}
	public static int[] shrink(int[] pix, int w, int h, int m, int n) {  
        float k1 = (float) m / w;  
        float k2 = (float) n / h;  
        int ii = (int)(1 / k1); // 采样的行间距  
        int jj = (int)(1 / k2); // 采样的列间距  
        int dd = ii * jj;  
    
        int[] newpix = new int[m * n];  
        for (int j = 0; j < n; j++) {  
            for (int i = 0; i < m; i++) {  
                int r = 0, g = 0, b = 0;  
                ColorModel cm = ColorModel.getRGBdefault();  
                for (int k = 0; k <  jj; k++) {  
                    for (int l = 0; l <  ii; l++) {  
                        r = r+cm.getRed(pix[(jj * j + k) * w +(ii * i + l)]);  
                        g = g+cm.getGreen(pix[(jj * j + k) * w+(ii * i + l)]);  
                        b = b+cm.getBlue(pix[ (jj * j + k) * w +(ii * i + l)]);  
                    }  
                }  
                r = r / dd;  
                g = g / dd;  
                b = b / dd;  
                newpix[j * m + i] = 255 << 24 | r << 16 | g << 8 | b;  
                  
            }  
        }  
        return newpix;  
    }  
	
	 public static int[] grayImage(int pix[], int w, int h) {  
	        
	        ColorModel cm = ColorModel.getRGBdefault();  
	        for(int i=0; i<h; i++) {  
	            for(int j=0; j<w; j++) {  
	              pix[i*w + j] = (int) (0.3*cm.getRed(pix[i*w + j]) + 0.58*cm.getGreen(pix[i*w + j]) + 0.12*cm.getBlue(pix[i*w + j]) );  
	            }  
	        }  
	        return pix;  
	    }  
	 
	 private static int averageGray(int[] pix, int w, int h) {  
	        int sum = 0;  
	        for(int i=0; i<h; i++) {  
	            for(int j=0; j<w; j++) {  
	                sum = sum+pix[i*w + j];  
	            }  
	              
	        }  
	        return (int)(sum/(w*h));  
	    }  
	 
	 public static BufferedImage readImage(String filename) {
		 try {
		 File inputFile = new File(filename);
		 BufferedImage sourceImage = ImageIO.read(inputFile);
		 return sourceImage;
		 } catch (FileNotFoundException e) {
		 e.printStackTrace();
		 }  catch (IOException e) {
		 e.printStackTrace();
		 }
		 return null;
		 }
	 private static char binaryToHex(int binary) {
		 char ch =' ';
		 switch (binary) {
		 case 0:
		 ch ='0';
		 break;
		 case 1:
		 ch = '1';
		 break;
		 case 2:
		 ch = '2';
		 break;
		 case 3:
		 ch = '3';
		 break;
		 case 4:
		 ch = '4';
		 break;
		 case 5:
		 ch = '5';
		 break;
		 case 6:
		 ch = '6';
		 break;
		 case 7:
		 ch = '7';
		 break;
		 case 8:
		 ch = '8';
		 break;
		 case 9:
		 ch = '9';
		 break;
		 case 10:
		 ch = 'a';
		 break;
		 case 11:
		 ch = 'b';
		 break;
		 case 12:
		 ch = 'c';
		 break;
		 case 13:
		 ch = 'd';
		 break;
		 case 14:
		 ch = 'e';
		 break;
		 case 15:
		 ch = 'f';
		 break;
		 default:
		 ch = ' ';
		 }
		 return ch;
		 }
	 public static int hammingDistance(String sourceHashCode, String hashCode) {
		 int difference = 0;
		 int len = sourceHashCode.length();
		 for (int i = 0; i < len; i++) {
		 if (sourceHashCode.charAt(i) != hashCode.charAt(i)) {
		 difference++;
		 }
		 }
		 return difference;
		 }
	 public static List collectionImgUrl(){
		 String imgPath ="G://jiwang//network4//images";
		 List list = new ArrayList();
		 File file = new File(imgPath);
		 if(file.isDirectory()){
		 String[] fileNames = file.list();
		 for(String name:fileNames){
		 list.add(imgPath.concat("//")+name);
		 }
		 }
		 return list;
		 }
}

