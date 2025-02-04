using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace E_Commerance_Website.Models
{
    public class CartItem
    {
        public int Id { get; set; }
        [ForeignKey("Products")]
        [Required]
        public int ProductId { get; set; }
        [Required]
        public string Name { get; set; }    
        public decimal Price { get; set; }
        [Required]
        public int Quantity { get; set; }

    }
}
