package a.gleb.databaseservice.configuration;

import a.gleb.databaseservice.configuration.properties.ApplicationConfigurationProperties;
import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import lombok.AllArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.core.convert.MongoCustomConversions;

import java.util.List;

@Configuration
@AllArgsConstructor
public class ServiceConfiguration {

    private final DocumentToZonedDateTimeCodec documentToZonedDateTimeCodec;
    private final ZonedDateTimeToDocumentCodec zonedDateTimeToDocumentCodec;

    @Bean
    public MongoCustomConversions customConversions() {
        return new MongoCustomConversions(List.of(documentToZonedDateTimeCodec, zonedDateTimeToDocumentCodec));
    }

    @Bean
    public OpenAPI openAPI(ApplicationConfigurationProperties applicationConfigurationProperties) {
        return new OpenAPI()
                .components(new Components())
                .info(
                        new Info()
                                .title("MongoDB Crud")
                                .description("Test application, pet")
                                .termsOfService(StringUtils.EMPTY)
                                .version(applicationConfigurationProperties.getApplicationVersion())
                );
    }


}
