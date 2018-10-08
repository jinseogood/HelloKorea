package com.kh.hello.board;

import java.io.File;

public class FileDeleteUpload {
	
    private static final String UPLOAD_FILE_PATH = "D:/git/HelloKorea/src/main/webapp/resources/uploadFiles/board/";
    
    public String process(String changeFileName) {
        
                    String newFile = UPLOAD_FILE_PATH + changeFileName;
                    File deleteFile = new File(newFile);
                    try {
                        deleteFile.delete();
                        return changeFileName + " 삭제완료";
                    } catch (IllegalStateException e) {
                        return changeFileName + " 삭제실패";
                    }
                
    }

}
