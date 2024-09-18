package com.crossdata.platform.dashboard.controller;

import com.crossdata.platform.dashboard.model.DashboardData;
import com.crossdata.platform.dashboard.service.DashboardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/dashboard")
public class DashboardController {

    @Autowired
    private DashboardService dashboardService;

    @GetMapping
    public DashboardData getDashboardData() {
        return dashboardService.getDashboardData();
    }
}