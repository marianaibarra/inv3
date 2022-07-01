using Moq;
using Xunit;
using FluentAssertions;
using DataAccess.Data;
using inv3_backend.Controllers;
using Core.Models;
using Microsoft.AspNetCore.Mvc;

namespace EndpointsTest;

public class BussinessController_Test
{
    #region Get One
    private readonly Mock<IBussinessData> _service = new();
    private readonly BussinessController _controller;
    public BussinessController_Test()
    {
        _controller = new(_service.Object);
    }

    [Fact]
    public async void GetOneBussiness_Test_ShouldReturnOkActionResult()
    {
        // Arrange
        var bussinessId = 2;

        // Act
        var data = await _controller.GetOneBussiness(bussinessId);

        // Assert
        Assert.IsType<OkObjectResult>(data);
    }

    [Fact]
    public async void GetOneBussiness_Test_ShouldReturnNotFoundActionResult()
    {
        // Arrange
        var bussinessId = 1;

        // Act
        var data = await _controller.GetOneBussiness(bussinessId);

        // Assert
        Assert.IsType<NotFoundResult>(data);
    }

    [Fact]
    public async void GetOneBussiness_Test_ShouldReturnMatchResult()
    {
        // Arrange
        int bussinessId = 2;

        var bussinessModel = new Bussiness
        {
            IdBussiness = 2,
            NameBussiness = "coca cola",
            Finance = 44213.00m,
            Owner = null,
            IsCountBalance = false
        };
        _service.Setup(x => x.GetOneBussiness(bussinessId)).ReturnsAsync(bussinessModel);

        // Act
        var data = await _controller.GetOneBussiness(bussinessId);

        // Assert
        Assert.IsType<OkObjectResult>(data);
        var okResult = data.Should().BeOfType<OkObjectResult>().Subject;
        var bussiness = okResult.Value;

        Assert.Equal(bussinessModel, bussiness);
    }
    #endregion

    #region Get All
    [Fact]
    public void GetBusinessses_Test_ShouldReturnOkResult()
    {
        // Arrange

        // Act

        // Assert
    }
    #endregion
}

