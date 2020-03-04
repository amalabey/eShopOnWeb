using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Text;

namespace SmokeTests.PageObjects
{
    public class BasketPage
    {
        private readonly IWebDriver _browser;

        public BasketPage(IWebDriver browser)
        {
            _browser = browser;
        }

        public string GetTitle()
        {
            return _browser.Title;
        }
    }
}
