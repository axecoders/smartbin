package com.techngage.smartbin;

/**
 * Created by aviraj_madkaiker on 2/19/2016.
 */
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;

public class InsertCoordinates {
    public static void main(String[] args) {
        MongoClient c =  new MongoClient();
        MongoDatabase db = c.getDatabase("city");
        MongoCollection<Document> city = db.getCollection("coordinates");
        Document coordinates = new Document("city", "panjim").append("coordinates", "15.496777,73.827827");
        city.insertOne(coordinates);
    }
}

