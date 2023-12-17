using Microsoft.AspNetCore.Mvc;
using MockDogApiDec17.Models;

namespace MockDogApiDec17.Controllers;

[ApiController]
[Route("[controller]")]
public class BreedsController : ControllerBase
{
    private readonly BreedService _breedService;

    public BreedsController()
    {
        _breedService = new BreedService();
    }

    [HttpGet]
    public IEnumerable<Breed> GetBreeds()
    {
        return _breedService.GetBreeds();
    }
}
