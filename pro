package main

import (
	"fmt"
)

// Product struct
type Product struct {
	id    int
	name  string
	price float64
}

func acptProducts() []Product {
	var productNum int
	fmt.Print("Enter  number of products: ")
	fmt.Scanln(&productNum)

	products := make([]Product, productNum)
	for i := 0; i < productNum; i++ {
		fmt.Printf("Enter details for product %d:\n", i+1)
		fmt.Print("Enter ID: ")
		fmt.Scanln(&products[i].id)
		fmt.Print("Enter Name: ")
		fmt.Scanln(&products[i].name)
		fmt.Print("Enter Price: ")
		fmt.Scanln(&products[i].price)
	}
	return products
}

func main() {
	products := acptProducts()
	// fmt.Println("Product List:")
	disProducts(products)

	averagePrice := calcAvgPrice(products)
	fmt.Printf("Average price: %f\n", averagePrice)
}

func disProducts(products []Product) {
	fmt.Println("Product List:")
	for _, product := range products {
		fmt.Printf("ID: %d, Name: %s, Price: %f\n", product.id, product.name, product.price)
	}
}

func calcAvgPrice(products []Product) float64 {
	if len(products) == 0 {
		return 0.0
	}
	totalPrice := 0.0
	for _, product := range products {
		totalPrice += product.price
	}
	return totalPrice / float64(len(products))
}
