package a.gleb.databaseservice.configuration;

import org.bson.Document;
import org.springframework.data.convert.ReadingConverter;
import org.springframework.stereotype.Component;
import org.springframework.core.convert.converter.Converter;

import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Date;

import static a.gleb.databaseservice.configuration.ZonedDateTimeToDocumentCodec.DATE_TIME;
import static a.gleb.databaseservice.configuration.ZonedDateTimeToDocumentCodec.ZONE;

@Component
@ReadingConverter
public class DocumentToZonedDateTimeCodec implements Converter<Document, ZonedDateTime> {

    @Override
    public ZonedDateTime convert(Document document) {
        Date dateTime = document.getDate(DATE_TIME);
        String zoneId = document.getString(ZONE);
        ZoneId zone = ZoneId.of(zoneId);
        return ZonedDateTime.ofInstant(dateTime.toInstant(), zone);
    }
}
