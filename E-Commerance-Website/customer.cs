namespace E_Commerance_Website
{
    public class Customer
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public string Type { get; set; }
        public string Password { get; set; }
        public string Address { get; set; }
        public ICollection<Order> Orders { get; set; }
      
    }
    public class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public int CategoryId { get; set; }
        public Category Category { get; set; }
        public ICollection<OrderDetail> OrderDetails { get; set; }
        public string Image { get; set; } // Added property for image data
    }


    public class Order
    {
        public int Id { get; set; }
        public DateTime OrderDate { get; set; }
        public int CustomerId { get; set; }
        public Customer Customer { get; set; }
        public int OrderStatusId { get; set; }
        public OrderStatus OrderStatus { get; set; }
        public ICollection<OrderDetail> OrderDetails { get; set; }
    }

    public class Category
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public ICollection<Product> Products { get; set; }
    }
        public class OrderDetail
    {
        public int Id { get; set; }
        public int OrderId { get; set; }
        public Order Order { get; set; }
        public int ProductId { get; set; }
        public Product Product { get; set; }
        public int Quantity { get; set; }
        public decimal UnitPrice { get; set; }
    }
    public class OrderStatus
    {
        public int Id { get; set; }
        public string Status { get; set; }
        public ICollection<Order> Orders { get; set; } // Many-to-One relationship
    }
    public class cartItem
    {
        public int ProductId { get; set; }
        public Product Product { get; set; }
        public int Quantity { get; set; }
    }
    }
