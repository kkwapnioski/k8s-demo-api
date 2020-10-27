package com.mutualofomaha.dci

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
class InfoController {

	@GetMapping("/info")
    public Map<String,String> info() {
        return [
            "requestId": UUID.randomUUID().toString(),
            "name": System.getenv("INSTANCE_NAME"),
            "version": System.getenv("VERSION"),
            "color": System.getenv("COLOR")
        ]
    }

}
