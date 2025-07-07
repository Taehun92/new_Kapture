package com.example.kapture.utils;

import com.google.gson.*;
import java.time.LocalDateTime;
import java.lang.reflect.Type;

public class GsonUtil {

    public static final Gson gson = new GsonBuilder()
        .registerTypeAdapter(LocalDateTime.class, new JsonSerializer<LocalDateTime>() {
            @Override
            public JsonElement serialize(LocalDateTime src, Type typeOfSrc, JsonSerializationContext context) {
                return new JsonPrimitive(src.toString()); // ISO-8601 형식
            }
        })
        .create();

}
