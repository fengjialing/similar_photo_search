package network4;

import java.awt.image.BufferedImage;
import java.awt.image.ColorModel;
import java.util.ArrayList;
import java.util.List;

public class searchColorImage {
	public static int width=32;
	public static int height=32;
	public static int []RED={255,0,0};
	public static int []BLUE={123,104,238};
	public static int []GREEN={0,255,255};
	public static int []BLACK={0,0,0};
	public static int []YELLOW={255,255,0};
	public static int []PURPLE={128,0,128};
	public static int []GRAY={192,192,192};
	
	public static final int Distance=100;
	
	public static List Red(List url_List){
		if(url_List==null)return null;
		List red_List=new ArrayList();
		for(Object url:url_List){
			if(isRed(url.toString()))red_List.add(url);
		}
		return red_List;
	}
	public static boolean isRed(String pic_url){
		BufferedImage sourceImage=phash.readImage(pic_url);
		int pic_w=sourceImage.getWidth();
		int pic_h=sourceImage.getHeight();
		int[] origin=new int[pic_w*pic_h];
		sourceImage.getRGB(0, 0, pic_w, pic_h,origin,0,pic_w); 
		int[] suoxiao=new int[width*height];
		suoxiao=phash.shrink(origin, sourceImage.getWidth(), sourceImage.getHeight(), width, height);
		ColorModel cm = ColorModel.getRGBdefault();
		int similar_pix=0;
		int absR=0;
		int absB=0;
		int absG=0;
		for(int i=0; i<height; i++) {  
	        for(int j=0; j<width; j++) { 
	        
	        	absR=cm.getRed(suoxiao[i*width + j])-RED[0];
	        	absG=cm.getGreen(suoxiao[i*width + j])-RED[1];
	        	absB=cm.getBlue(suoxiao[i*width + j])-RED[2]; 
	         if(Math.sqrt(absR*absR+absG*absG+absB*absB)<Distance)similar_pix++; 
	       
	        }  
	    }
		if(similar_pix>200)return true;
		return false;
	}
	
	public static boolean isBlue(String pic_url){
		BufferedImage sourceImage=phash.readImage(pic_url);
		int pic_w=sourceImage.getWidth();
		int pic_h=sourceImage.getHeight();
		int[] origin=new int[pic_w*pic_h];
		sourceImage.getRGB(0, 0, pic_w, pic_h,origin,0,pic_w); 
		int[] suoxiao=new int[width*height];
		suoxiao=phash.shrink(origin, sourceImage.getWidth(), sourceImage.getHeight(), width, height);
		ColorModel cm = ColorModel.getRGBdefault();
		int similar_pix=0;
		int absR=0;
		int absB=0;
		int absG=0;
		for(int i=0; i<height; i++) {  
	        for(int j=0; j<width; j++) { 
	        
	        	absR=cm.getRed(suoxiao[i*width + j])-BLUE[0];
	        	absG=cm.getGreen(suoxiao[i*width + j])-BLUE[1];
	        	absB=cm.getBlue(suoxiao[i*width + j])-BLUE[2]; 
	         if(Math.sqrt(absR*absR+absG*absG+absB*absB)<Distance)similar_pix++; 
	       
	        }  
	    }
		if(similar_pix>200)return true;
		return false;
	}
	public static List Blue(List url_List){
		if(url_List==null)return null;
		List blue_List=new ArrayList();
		for(Object url:url_List){
			if(isBlue(url.toString()))blue_List.add(url);
		}
		return blue_List;
	}
	public static boolean isGreen(String pic_url){
		BufferedImage sourceImage=phash.readImage(pic_url);
		int pic_w=sourceImage.getWidth();
		int pic_h=sourceImage.getHeight();
		int[] origin=new int[pic_w*pic_h];
		sourceImage.getRGB(0, 0, pic_w, pic_h,origin,0,pic_w); 
		int[] suoxiao=new int[width*height];
		suoxiao=phash.shrink(origin, sourceImage.getWidth(), sourceImage.getHeight(), width, height);
		ColorModel cm = ColorModel.getRGBdefault();
		int similar_pix=0;
		int absR=0;
		int absB=0;
		int absG=0;
		for(int i=0; i<height; i++) {  
	        for(int j=0; j<width; j++) { 
	        
	        	absR=cm.getRed(suoxiao[i*width + j])-GREEN[0];
	        	absG=cm.getGreen(suoxiao[i*width + j])-GREEN[1];
	        	absB=cm.getBlue(suoxiao[i*width + j])-GREEN[2]; 
	         if(Math.sqrt(absR*absR+absG*absG+absB*absB)<Distance)similar_pix++; 
	       
	        }  
	    }
		if(similar_pix>20)return true;
		return false;
	}
	public static List Green(List url_List){
		if(url_List==null)return null;
		List green_List=new ArrayList();
		for(Object url:url_List){
			if(isGreen(url.toString()))green_List.add(url);
		}
		return green_List;
	}
	public static boolean isYellow(String pic_url){
		BufferedImage sourceImage=phash.readImage(pic_url);
		int pic_w=sourceImage.getWidth();
		int pic_h=sourceImage.getHeight();
		int[] origin=new int[pic_w*pic_h];
		sourceImage.getRGB(0, 0, pic_w, pic_h,origin,0,pic_w); 
		int[] suoxiao=new int[width*height];
		suoxiao=phash.shrink(origin, sourceImage.getWidth(), sourceImage.getHeight(), width, height);
		ColorModel cm = ColorModel.getRGBdefault();
		int similar_pix=0;
		int absR=0;
		int absB=0;
		int absG=0;
		for(int i=0; i<height; i++) {  
	        for(int j=0; j<width; j++) { 
	        
	        	absR=cm.getRed(suoxiao[i*width + j])-YELLOW[0];
	        	absG=cm.getGreen(suoxiao[i*width + j])-YELLOW[1];
	        	absB=cm.getBlue(suoxiao[i*width + j])-YELLOW[2]; 
	         if(Math.sqrt(absR*absR+absG*absG+absB*absB)<Distance)similar_pix++; 
	       
	        }  
	    }
		if(similar_pix>200)return true;
		return false;
	}
	public static List Yellow(List url_List){
		if(url_List==null)return null;
		List yellow_List=new ArrayList();
		for(Object url:url_List){
			if(isYellow(url.toString()))yellow_List.add(url);
		}
		return yellow_List;
	}
	public static boolean isBlack(String pic_url){
		BufferedImage sourceImage=phash.readImage(pic_url);
		int pic_w=sourceImage.getWidth();
		int pic_h=sourceImage.getHeight();
		int[] origin=new int[pic_w*pic_h];
		sourceImage.getRGB(0, 0, pic_w, pic_h,origin,0,pic_w); 
		int[] suoxiao=new int[width*height];
		suoxiao=phash.shrink(origin, sourceImage.getWidth(), sourceImage.getHeight(), width, height);
		ColorModel cm = ColorModel.getRGBdefault();
		int similar_pix=0;
		int absR=0;
		int absB=0;
		int absG=0;
		for(int i=0; i<height; i++) {  
	        for(int j=0; j<width; j++) { 
	        
	        	absR=cm.getRed(suoxiao[i*width + j])-BLACK[0];
	        	absG=cm.getGreen(suoxiao[i*width + j])-BLACK[1];
	        	absB=cm.getBlue(suoxiao[i*width + j])-BLACK[2]; 
	         if(Math.sqrt(absR*absR+absG*absG+absB*absB)<70)similar_pix++; 
	       
	        }  
	    }
		if(similar_pix>20)return true;
		return false;
	}
	public static List Black(List url_List){
		if(url_List==null)return null;
		List black_List=new ArrayList();
		for(Object url:url_List){
			if(isBlack(url.toString()))black_List.add(url);
		}
		return black_List;
	}
	public static boolean isPurple(String pic_url){
		BufferedImage sourceImage=phash.readImage(pic_url);
		int pic_w=sourceImage.getWidth();
		int pic_h=sourceImage.getHeight();
		int[] origin=new int[pic_w*pic_h];
		sourceImage.getRGB(0, 0, pic_w, pic_h,origin,0,pic_w); 
		int[] suoxiao=new int[width*height];
		suoxiao=phash.shrink(origin, sourceImage.getWidth(), sourceImage.getHeight(), width, height);
		ColorModel cm = ColorModel.getRGBdefault();
		int similar_pix=0;
		int absR=0;
		int absB=0;
		int absG=0;
		for(int i=0; i<height; i++) {  
	        for(int j=0; j<width; j++) { 
	        
	        	absR=cm.getRed(suoxiao[i*width + j])-PURPLE[0];
	        	absG=cm.getGreen(suoxiao[i*width + j])-PURPLE[1];
	        	absB=cm.getBlue(suoxiao[i*width + j])-PURPLE[2]; 
	         if(Math.sqrt(absR*absR+absG*absG+absB*absB)<Distance)similar_pix++; 
	       
	        }  
	    }
		if(similar_pix>200)return true;
		return false;
	}
	public static List Purple(List url_List){
		if(url_List==null)return null;
		List purple_List=new ArrayList();
		for(Object url:url_List){
			if(isPurple(url.toString()))purple_List.add(url);
		}
		return purple_List;
	}
	
}
