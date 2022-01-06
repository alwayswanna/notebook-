package a.gleb.databaseservice.configuration;

import org.bson.Document;
import org.springframework.core.convert.converter.Converter;
import org.springframework.data.convert.WritingConverter;
import org.springframework.stereotype.Component;

import java.time.ZonedDateTime;
import java.util.Date;

@Component
@WritingConverter
public class ZonedDateTimeToDocumentCodec implements Converter<ZonedDateTime, Document> {

    public static final String DATE_TIME = "dateTime";
    public static final String ZONE = "zone";


    @Override
    public Document convert(ZonedDateTime source) {
        Document document = new Document();
        document.put(DATE_TIME, Date.from(source.toInstant()));
        document.put(ZONE, source.getZone().getId());
        document.put("offset", source.getOffset().toString());
        return document;
    }
}
