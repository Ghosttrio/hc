package com.spring.ex01.emp.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

@Configuration
public class TilesConfig {

    // TilesConfigurer
    @Bean
    public TilesConfigurer tilesConfigurer() {
        final TilesConfigurer configurer = new TilesConfigurer();

        // tiles.xml 경로 명시
        configurer.setDefinitions(new String[] {
            "/WEB-INF/tiles/tiles_member.xml"
        });

        // 리프레쉬 가능 여부 설정
        configurer.setCheckRefresh(true);

        return configurer;
    }

    // TilesViewResolver
    @Bean
    public TilesViewResolver tilesViewResolver() {
        final TilesViewResolver tilesViewResolver = new TilesViewResolver();
        tilesViewResolver.setViewClass(TilesView.class);
        tilesViewResolver.setOrder(1); //뷰 우선순위
        return tilesViewResolver;
    }
}
