package com.tang.taste.common.util;

import org.apache.zookeeper.data.Stat;
import org.csource.common.NameValuePair;
import org.csource.fastdfs.*;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

/**
 * FileName: FastdfsUitls
 * @Author:   16
 * Date:     2018/4/25 9:30
 * Description:文件服务器工具类
 */
public class FastdfsUitls {

    //客户端配置文件
    public static String conf_filename = "E:\\IDEAworkpace\\taste\\taste-common\\src\\main\\java\\com\\tang\\taste\\common\\util\\fdfs_client.conf";

    /**
     * 上传文件
     * @param local_filename
     * @param fileExtName
     */
    public static String[] uploadFile(byte[] local_filename,String fileExtName){
        try {
            ClientGlobal.init(conf_filename);

            TrackerClient tracker = new TrackerClient();
            TrackerServer trackerServer = tracker.getConnection();
            StorageServer storageServer = null;

            StorageClient storageClient = new StorageClient(trackerServer,
                    storageServer);
            NameValuePair nvp [] = new NameValuePair[]{
                    new NameValuePair("item_id", "100010"),
                    new NameValuePair("width", "80"),
                    new NameValuePair("height", "90")
            };
            String fileIds[] = storageClient.upload_file(local_filename, fileExtName,
                    nvp);

            System.out.println(fileIds.length);
            System.out.println("组名：" + fileIds[0]);
            System.out.println("路径: " + fileIds[1]);
            return fileIds;
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    //将字节流写到磁盘生成文件
    private static void saveFile(byte[] b, String path, String fileName) {

        File file = new File(path+fileName);
        FileOutputStream fileOutputStream = null;
        try {
            fileOutputStream= new FileOutputStream(file);

            fileOutputStream.write(b);

        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally{
            if(fileOutputStream!=null){
                try {
                    fileOutputStream.close();
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }

        }

    }

    /**
     * 下载文件 保存D盘
     * @param group
     * @param filename
     */
    public static void downloadFile(String group,String filename){
        try {

            ClientGlobal.init(conf_filename);

            TrackerClient tracker = new TrackerClient();
            TrackerServer trackerServer = tracker.getConnection();
            StorageServer storageServer = null;

//            StorageClient storageClient = new StorageClient(trackerServer,
//                    storageServer);
            StorageClient1 storageClient = new StorageClient1(trackerServer, storageServer);
            byte[] b = storageClient.download_file(group,
                    filename);
            if(b !=null){
                System.out.println(b.length);
                saveFile(b, "D:\\jar\\", UUID.randomUUID().toString()+".jpg");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取文件信息
     * @param group
     * @param filename
     */
    public static void getFileInfo(String group,String filename){
        try {
            ClientGlobal.init(conf_filename);

            TrackerClient tracker = new TrackerClient();
            TrackerServer trackerServer = tracker.getConnection();
            StorageServer storageServer = null;

            StorageClient storageClient = new StorageClient(trackerServer,
                    storageServer);
            FileInfo fi = storageClient.get_file_info(group, filename);
            System.out.println(fi.getSourceIpAddr());
            System.out.println(fi.getFileSize());
            System.out.println(fi.getCreateTimestamp());
            System.out.println(fi.getCrc32());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取文件自定义的mate信息(key、value)
     * @param group
     * @param filename
     */
    public static void getFileMate(String group,String filename){
        try {
            ClientGlobal.init(conf_filename);

            TrackerClient tracker = new TrackerClient();
            TrackerServer trackerServer = tracker.getConnection();
            StorageServer storageServer = null;

            StorageClient storageClient = new StorageClient(trackerServer,
                    storageServer);
            NameValuePair nvps [] = storageClient.get_metadata(group, filename);
            if(nvps!=null){
                for(NameValuePair nvp : nvps){
                    System.out.println(nvp.getName() + ":" + nvp.getValue());
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 删除文件
     * @param group
     * @param filename
     */
    public static  void deletedFile(String group,String filename){
        try {
            ClientGlobal.init(conf_filename);

            TrackerClient tracker = new TrackerClient();
            TrackerServer trackerServer = tracker.getConnection();
            StorageServer storageServer = null;

            StorageClient storageClient = new StorageClient(trackerServer,
                    storageServer);
            int i = storageClient.delete_file(group, filename);
            System.out.println( i==0 ? "删除成功" : "删除失败:"+i);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
