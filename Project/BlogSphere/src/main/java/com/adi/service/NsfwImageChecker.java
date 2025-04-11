package com.adi.service;

import java.io.IOException;

import org.json.JSONObject;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

@Service
public class NsfwImageChecker {

    private final String apiUser = "my_api_user";
    private final String apiSecret = "my_api_secret";

    public boolean isImageSafe(MultipartFile file) throws IOException {
        String url = "https://api.sightengine.com/1.0/check.json";

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.MULTIPART_FORM_DATA);

        MultiValueMap<String, Object> body = new LinkedMultiValueMap<>();
        body.add("models", "nudity-2.1,offensive-2.0,scam,face-attributes,gore-2.0,self-harm,gambling");
        body.add("api_user", apiUser);
        body.add("api_secret", apiSecret);
        body.add("media", new ByteArrayResource(file.getBytes()) {
            @Override
            public String getFilename() {
                return file.getOriginalFilename();
            }
        });

        HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(body, headers);

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.postForEntity(url, requestEntity, String.class);

        // Parse response (for demo, just printing)
        JSONObject json = new JSONObject(response.getBody());
        System.out.println(json);
        // Decision logic based on Sightengine's score
        double sexualActivity = json.getJSONObject("nudity").getDouble("sexual_activity");
        boolean isScam = json.getJSONObject("scam").getDouble("prob") > 0.5;
        boolean hasGore = json.getJSONObject("gore").getDouble("prob") > 0.5;
        boolean selfHarm = json.getJSONObject("self-harm").getDouble("prob") > 0.3;


        
        return sexualActivity < 0.5 && !isScam && !hasGore && !selfHarm;
    }
}
