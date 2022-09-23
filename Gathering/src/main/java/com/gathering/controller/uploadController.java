package com.gathering.controller;

import java.awt.Graphics2D;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.gathering.dto.FilesVO;


@RestController

public class uploadController {
	private final Logger logger = LoggerFactory.getLogger("NoticeController 의 로그");

	// 업로드 파일 첨부하기
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<FilesVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {

		logger.info("uploadAjaxActionPoast");

		/* 이미지 파일 체크 */
		for (MultipartFile multipartFile : uploadFile) {

			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;

			try {
				type = Files.probeContentType(checkfile.toPath());
				logger.info("MIME TYPE : " + type);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (!type.startsWith("image")) {

				List<FilesVO> list = null;
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);

			}
		}

		String uploadFolder = "C:\\upload";

		// 날짜 경로
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		String datePath = str.replace("-", File.separator);

		File uploadPath = new File(uploadFolder, datePath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		
		/* 이미저 정보 담는 객체 */
		List<FilesVO> list = new ArrayList<>();

		// for문
		for (MultipartFile multipartFile : uploadFile) {
			// 이미지 정보 객체
			FilesVO filesVO = new FilesVO();

			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();
			filesVO.setFileName(uploadFileName);
			filesVO.setUploadPath(datePath);

			/* uuid 적용 파일 이름 */
			String uuid = UUID.randomUUID().toString();
			filesVO.setUuid(uuid);
			uploadFileName = uuid + "_" + uploadFileName;

			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);

			/* 파일 저장 */
			try {
				multipartFile.transferTo(saveFile);

				// 썸네일 생성하기
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);

				BufferedImage bo_image = ImageIO.read(saveFile);
				/* 비율 */
				double ratio = 3;
				/* 넓이 높이 */
				int width = (int) (bo_image.getWidth() / ratio);
				int height = (int) (bo_image.getHeight() / ratio);

				BufferedImage bt_image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);

				Graphics2D graphic = bt_image.createGraphics();

				graphic.drawImage(bo_image, 0, 0, width, height, null);

				ImageIO.write(bt_image, "jpg", thumbnailFile);

			} catch (Exception e) {
				e.printStackTrace();
			}

			list.add(filesVO);
		}
		ResponseEntity<List<FilesVO>> result = new ResponseEntity<List<FilesVO>>(list, HttpStatus.OK);

		System.out.println(list);
		return result;
	}
	
	
	
	

}
        
     
        
        
      