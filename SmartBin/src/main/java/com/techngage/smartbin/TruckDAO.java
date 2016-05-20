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
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.MongoCollection;

import org.bson.Document;

import java.util.*;

public class TruckDAO {
    private final MongoCollection<Document> truckCollection;
    private final ThreadLocal<Random> random = new ThreadLocal<Random>();

    public TruckDAO(final MongoDatabase smartbinDatabase) {
        truckCollection = smartbinDatabase.getCollection("truck");
    }

    // Gets all the truck Ids available.
    public List<Document> getTruckIds() {
        try {
            List<Document> truckIds = truckCollection.find().into(new ArrayList<Document>());
            //List<Document> truckIds = truckCollection.find(new Document("status","")).into(new ArrayList<Document>());
            return truckIds;

        } catch (MongoWriteException e) {
            throw e;
        }
    }

    // Update truck details
    public String updateTruckAsAssigned(String truckId) {
        try {
            Document id = new Document();
            id.append("truckid", truckId);
            truckCollection.updateOne(new Document("truckid", truckId),new Document("$set", new Document("status","assigned")));
            return truckId;
        } catch (MongoWriteException e) {
            throw e;
        }
    }

    // Update truck details
    public String updateTruckAsUnAssigned(String truckId, boolean state) {
        try {
            Document id = new Document();
            id.append("truckid", truckId);
            if(!state){
                truckCollection.updateOne(new Document("truckid", truckId),new Document("$set", new Document("status","")));
            }
            return truckId;
        } catch (MongoWriteException e) {
            throw e;
        }
    }
}
