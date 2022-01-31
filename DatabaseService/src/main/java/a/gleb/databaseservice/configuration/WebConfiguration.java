package a.gleb.databaseservice.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
public class WebConfiguration extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        var note_uri = "/api/note";
        http
                .cors().disable()
                .csrf().disable()
                .authorizeHttpRequests()
                .antMatchers(
                        note_uri,
                        note_uri + "/**",
                        "/swagger-ui/**",
                        "/v3/api-docs/**"

                ).permitAll()
                .anyRequest().authenticated();
    }
}
