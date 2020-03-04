using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Text;

namespace SmokeTests.PageObjects
{
    public class HomePage
    {
        private readonly IWebDriver _browser;

        public HomePage(IWebDriver browser, string baseUrl)
        {
            _browser = browser;
            _browser.Navigate().GoToUrl(baseUrl + "/");
        }

        public BasketPage AddToBasket()
        {
            _browser.FindElement(By.CssSelector("input.esh-catalog-button")).Click();
            return new BasketPage(_browser);
        }
    }
}
