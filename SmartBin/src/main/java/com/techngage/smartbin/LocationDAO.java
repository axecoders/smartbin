/*
 * Copyright 2013-2015 MongoDB Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

package com.techngage.smartbin;

import com.mongodb.MongoWriteException;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class LocationDAO {
    private final MongoCollection<Document> locationCollection;
    private final ThreadLocal<Random> random = new ThreadLocal<Random>();

    public LocationDAO(final MongoDatabase smartbinDatabase) {
        locationCollection = smartbinDatabase.getCollection("location");
    }

    // Insert location and coordinates into location db
    public void insertRoute(String location, String coordinates) {
        try {
            Document id = new Document();
            id.append("location", location);
            id.append("coordinates", coordinates);
            locationCollection.insertOne(id);
            } catch (MongoWriteException e) {
            throw e;
        }
    }

    // Check for duplicate entry in locations table
    public boolean checkDuplicateRoute(String coordinates) {
        try {
            List<Document> routes = locationCollection.find(new Document("coordinates",coordinates)).into(new ArrayList<Document>());
            return routes.size()>0;
        } catch (MongoWriteException e) {
            throw e;
        }
    }
}
