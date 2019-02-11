# FileUploadEX
파일 업로드 / 삭제 TEST

1. 라이브러리 추가 (imgscalr-lib  /commons-fileupload)

2. 웹과 관련된 객체를 설정하기 위해서 servlet-context.xml에 multipartResolver 설정

3. 서버의 파일 저장 경로 설정 (상수 처럼 사용될 폴더 지정 : servlet-context.xml)

4-1. 스프링에서 제공하는 FileCopyUtils를 이용한 업로드 (UUID를 통해 파일 업로드 시 중복된 이름의 파일이 등록되지 않도록 막음)

4-2. iframe을 이용하여 ajax가 아니지만 화면 전환 효과를 막으면서 파일 업로드를 시킬 수 있었음.

5-1. Ajax 방식의 파일 업로드 : Drag & Drop 방식으로 연습(단일 파일 업로드 기준)

5-2. 미리 div를 설정하여 Drag할 공간을 만들어 놓는다.

5-3. dataTranser.files // Drop으로 전달된 파일 데이터를 가져오는 핵심

5-4. HTML5에서 지원하는 FormData 객체를 이용하여 파일 데이터 전송

5-6. ajax 처리 시 가장 중요한 점은 processData, contentType 옵션을 false로 지정해야 한다는 것!

5-6. UploadFileUtils 업로그 기능을 설계 : 파일의 저장 경로 / 원본 파일의 이름 / 파일 데이터 3가지가 중요하다.

5-7. 중복 방지를 위해 업로드 시 파일명에 '/년/월/일'가 들어가도록 하고 폴더 또한 '/년/월/일'을 만들어 생성되도록 한다.

5-8. 화면 상으로는 썸네일이 나오도록 설계

5-9. 중요한 것은 이미지 or 이미지가 아닌 경우를 판단해야 하는데 이미지라면 MediaUtils를 통해 확장자로 타입을 나눠준다.

5-10. 업로드 파일을 받을 때는 Controller 매개변수로 MultipartFile을 만들어준다.

5-11. MIME 타입 지정하여 이미지를 출력해줄 것인지 파일을 다운로드 받게 할 것인지 설계

5-12. 삭제는 원본 파일을 먼저 삭제하고 이후 파일을 삭제하도록 만들 것


ps. 몇 줄 안 되는 내용인데 필요할 때 소스 보고 참고하거나 자주 사용해보는 게 답일 거 같다.
