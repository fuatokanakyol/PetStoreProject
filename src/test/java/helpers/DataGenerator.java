package helpers;

import com.github.javafaker.Faker;
import net.minidev.json.JSONArray;
import net.minidev.json.JSONObject;

public class DataGenerator {
    public static JSONObject getRandomPetValues(){
        Faker faker = new Faker();
        String id = String.valueOf(faker.number().numberBetween(1, 1000)); // id değerini 1 ve 1000 arasında sınırla

        String name;
        do {
            name = faker.animal().name();
        } while (name.isEmpty() || name.equals("")); // boş veya boşluktan oluşan bir isim üretilene kadar tekrarla

        JSONObject category = new JSONObject();
        category.put("id", faker.number().numberBetween(1, 1000));
        category.put("name", faker.lorem().word());

        JSONArray photoUrls = new JSONArray();
        photoUrls.add(faker.internet().image());

        JSONObject tag = new JSONObject();
        tag.put("id", faker.number().numberBetween(1, 1000));
        tag.put("name", faker.lorem().word());

        JSONArray tags = new JSONArray();
        tags.add(tag);

        JSONObject json = new JSONObject();
        json.put("id", id);
        json.put("category", category);
        json.put("name", name);
        json.put("photoUrls", photoUrls);
        json.put("tags", tags);

        return json;
    }
    public static JSONObject getRandomUserValues(){
        Faker faker = new Faker();
        int id = faker.number().numberBetween(1, 1000); // id değerini 1 ve 1000 arasında sınırla
        int userStatus = faker.number().numberBetween(1,1); // id değerini 1 ve 1000 arasında sınırla

        String username,firstName,lastName,email,password,phone;

        username = faker.name().username();
        firstName = faker.name().firstName();
        lastName = faker.name().lastName();
        email = lastName + "@mail.com";
        password = faker.gameOfThrones().character();
        phone = faker.phoneNumber().cellPhone();

        JSONObject json = new JSONObject();
        json.put("id", id);
        json.put("userStatus", userStatus);
        json.put("username", username);
        json.put("firstName", firstName);
        json.put("lastName", lastName);
        json.put("email", email);
        json.put("password", password);
        json.put("phone", phone);

        return json;
    }
}
