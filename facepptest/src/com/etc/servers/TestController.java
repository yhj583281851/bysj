package com.etc.servers;

@Controller
@RequestMapping(value="/face")
@RestController
public class FaceController {

    @Autowired
    private FaceUserService faceService;

    @RequestMapping(value="/photograph")
    public JsonResult getFace(String imgString,String name) throws IOException {


        String str = FaceUtil.checkFace(imgString);

         JSONObject json = JSONObject.fromObject(str);
         try {
             String faces = json.getString("faces");
             if("[]".equals(faces)) {
                 return new JsonResult("0", "对不起，您上传的不是用户头像或者照片质量不达标，请重新上传！", null);
             }
             JSONObject josnToken = JSONObject.fromObject(faces.substring(1, faces.length()-1));
             String token = josnToken.getString("face_token");
             FaceUser user = new FaceUser();
             user.setName(name);
             user.setFaceToken(token);
             faceService.add(user);
        } catch (Exception e) {
            // TODO: handle exception   
             e.printStackTrace();
             return new JsonResult("0", "系统繁忙，请稍后重试！", null);
        }
       return new JsonResult("1", "上传成功，请登录！", null);
    }

}
