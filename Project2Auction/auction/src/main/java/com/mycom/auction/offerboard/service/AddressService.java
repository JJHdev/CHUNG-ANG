package com.mycom.auction.offerboard.service;
/*@Service
public class AddressService {
	private final String KAKAO_MAP_API_KEY = "카카오맵 API key 입력";

    public Address searchAddress(String query) {
        String url = "https://dapi.kakao.com/v2/local/search/address.json?query=" + query;
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + KAKAO_MAP_API_KEY);
        HttpEntity<String> entity = new HttpEntity<>(headers);
        ResponseEntity<String> response = new RestTemplate().exchange(url, HttpMethod.GET, entity, String.class);
        if (response.getStatusCode() != HttpStatus.OK) {
            throw new RuntimeException("주소 검색에 실패하였습니다.");
        }
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            JsonNode rootNode = objectMapper.readTree(response.getBody()).get(0);
            String roadAddress = rootNode.get("road_address").get("address_name").asText();
            String jibunAddress = rootNode.get("address").get("address_name").asText();
            double longitude = rootNode.get("x").asDouble();
            double latitude = rootNode.get("y").asDouble();
            return new Address(roadAddress, jibunAddress, longitude, latitude);
        } catch (Exception e) {
            throw new RuntimeException("주소 검색 결과를 변환하는데 실패하였습니다.");
        }
    }
}
*/