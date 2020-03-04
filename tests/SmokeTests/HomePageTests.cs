using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using SmokeTests.PageObjects;
using System;
using Xunit;

namespace SmokeTests
{
    public class HomePageTests
    {
        private string appURL = "https://localhost:5001";

        [Fact]
        public void AddToBasket_LoadsBasketPage()
        {
            IWebDriver driver = new ChromeDriver();
            driver.Navigate().GoToUrl(appURL + "/");
            driver.FindElement(By.CssSelector("input.esh-catalog-button")).Click();
            Assert.True(driver.Title.Contains("Basket"), "Navigate to basket verified");
            driver.Quit();
        }

        [Fact]
        public void AddToBasket_LoadsBasketPage_UsingObject()
        {
            IWebDriver driver = new ChromeDriver();

            var homePage = new HomePage(driver, "https://localhost:5001");
            var basketPage = homePage.AddToBasket();

            Assert.True(basketPage.GetTitle().Contains("Basket"), "Navigate to basket verified");
            driver.Quit();
        }
    }
}
