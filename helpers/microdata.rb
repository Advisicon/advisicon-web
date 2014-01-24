#!/bin/env ruby
#encoding: utf-8

def hiringOrganization(org_name)
   "<span itemprop='hiringOrganization' " +
         "itemscope itemtype='http://schema.org/Organization' >" +
         "<span itemprop='name'>#{org_name}</span></span>"
end
def industry(industry_name)
   "<span itemprop='industry'>#{industry_name}</span>"
end
def location(locality, region)
   "<span itemprop='jobLocation' itemscope " +
         "itemtype='http://schema.org/Place'>" +
            "<span itemprop='address' itemscope " +
            "itemtype='http://schema.org/PostalAddress'>" +
              "<span itemprop='addressLocality'>#{locality}</span>, " +
              "<span itemprop='addressRegion'>#{region}</span>" +
            "</span>" +
          "</span>"
end
def base_salary(amount)
  "<span itemprop='baseSalary'>#{amount}</span>"
end
