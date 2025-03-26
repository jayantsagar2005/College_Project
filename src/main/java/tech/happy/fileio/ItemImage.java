package tech.happy.fileio;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class ItemImage {
	
	public void deleteFile(String path){

        try{ 

            File file = new File(path);
            file.delete();

        }catch (Exception e){
            e.printStackTrace();

        }
    }

    public boolean saveFile(InputStream is, String path){
        boolean result = false;
        try{
            byte[] bytes = new byte[is.available()];
            is.read(bytes);
            FileOutputStream fos = new FileOutputStream(path);
            fos.write(bytes);
            fos.flush();
            fos.close();
            result = true;


        }catch (Exception e){
            e.printStackTrace();
        }

        return result;
    }
}
