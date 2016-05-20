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

public class RouteDAO {
    private final MongoCollection<Document> routeCollection;
    private final ThreadLocal<Random> random = new ThreadLocal<Random>();

    public RouteDAO(final MongoDatabase smartbinDatabase) {
        routeCollection = smartbinDatabase.getCollection("route");
    }

    // Assign route to driver
    public boolean checkRouteAssigned(String truckId) {
        try {
            Document id = new Document();
            id.append("truckid", truckId);
            List<Document> routes = routeCollection.find(new Document("truckid", truckId)).into(new ArrayList<Document>());
            return (routes.size()>=1);
        } catch (MongoWriteException e) {
            throw e;
        }
    }

    // Assign route to driver
    public String assignRoute(String truckId, int routeId) {
        try {
                Document id = new Document();
                id.append("truckid", truckId);
                routeCollection.updateOne(new Document("routeid", routeId),new Document("$set", new Document("truckid",truckId)));
            return truckId;
            } catch (MongoWriteException e) {
                throw e;
          }
    }

    // Assign route to driver
    public String unassignRoute(String truckId, int routeId) {
        try {
            Document id = new Document();
            id.append("truckid", truckId);
            routeCollection.updateOne(new Document("routeid", routeId),new Document("$set", new Document("truckid","")));
            return truckId;
        } catch (MongoWriteException e) {
            throw e;
        }
    }

    // Gets the route from db
    public String getRoute() {
        try {
            //Testing...
            //String routeStr = "(15.3860,73.8440);(15.3991,74.0124);(15.2832,73.9862);(15.4909,73.8278);(15.4874553,73.977126);(15.40089331,74.00073051);(15.40693387,74.01896954)";
            //String routeStr ="(15.31138147,73.99564505);(15.32052891,73.9843154);(15.308484,73.98847818);(15.3030615,73.96676302);(15.2918849,73.98581743);(15.29101558,73.97603273);(15.27896897,73.96380186);(15.28555123,73.94916773);(15.2972249,73.96114111);(15.29825977,73.97109747);(15.28389533,73.97289991);(15.26791529,73.96204233);(15.27010951,73.99066687);(15.284761,73.957397);(15.291632,73.969628);(15.285299,73.962375);(15.285671,73.957118);(15.289604,73.963341);(15.289707,73.954843);(15.282111,73.959478);(15.277744,73.960465)";
            //String routeStr = "(15.3860,73.8440);(15.3991,74.0124);(15.2832,73.9862);(15.2832,73.9862);";
            //String routeStr = "(15.3860,73.8440);(15.3991,74.0124);(15.2832,73.9862);(15.4909,73.8278);(15.4874553,73.977126);(15.40089331,74.00073051);(15.40693387,74.01896954);(15.3860,73.8440);(15.3991,74.0124);(15.2832,73.9862)";
            //String routeStr ="(15.31138147,73.99564505);(15.32052891,73.9843154);(15.308484,73.98847818);(15.3030615,73.96676302);(15.2918849,73.98581743);(15.29101558,73.97603273);(15.27896897,73.96380186);(15.28555123,73.94916773);(15.2972249,73.96114111);(15.29825977,73.97109747);(15.28389533,73.97289991);(15.26791529,73.96204233);(15.27010951,73.99066687);(15.284761,73.957397)";
            List<Document> routes = routeCollection.find().sort(new Document("date", 1)).limit(1).into(new ArrayList<Document>());
            Document test = routes.get(0);
            String routeStr = (String)test.get("route");
            return routeStr;
        } catch (MongoWriteException e) {
            throw e;
        }
    }

    // Gets the route from db
    public List<Document> getRoutes(int limit) {
        try {
            List<Document> routes = routeCollection.find().sort(new Document("date", 1)).limit(limit).into(new ArrayList<Document>());

            return routes;

        } catch (MongoWriteException e) {
            throw e;
        }
    }

    // Gets escalated routes from db
    public List<Document> getEscalatedRoutes() {
        try {
            List<Document> routes = routeCollection.find(new Document("status","level1")).sort(new Document("date", 1)).into(new ArrayList<Document>());

            return routes;

        } catch (MongoWriteException e) {
            throw e;
        }
    }

    // Gets escalated routes from db
    public List<Document> getInProgressRoutes() {
        try {
            List<Document> routes = routeCollection.find(new Document("status","inprogress")).sort(new Document("date", 1)).into(new ArrayList<Document>());

            return routes;

        } catch (MongoWriteException e) {
            throw e;
        }
    }

    // Gets escalated routes from db
    public List<Document> getCompletedRoutes() {
        try {
            List<Document> routes = routeCollection.find(new Document("status","done")).sort(new Document("date", 1)).into(new ArrayList<Document>());

            return routes;

        } catch (MongoWriteException e) {
            throw e;
        }
    }

    // Gets the route from db
    public void insertRoute(String route) {
        try {
            Document id = new Document();
            id.append("route", route);
            routeCollection.insertOne(id);
            } catch (MongoWriteException e) {
            throw e;
        }
    }
}
