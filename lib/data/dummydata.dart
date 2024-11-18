import 'package:books/models/models/categories.dart';
import 'package:books/models/models/items.dart';

final availableCategories = [
  const Categories(
    id: 'C1',
    title: 'Books',
  ),
  const Categories(
    title: 'Electronic Gadgets',
    id: 'C2',
  ),
  const Categories(
    title: 'Furniture',
    id: 'C3',
  ),
  const Categories(
    title: 'Vehicle',
    id: 'C4',
  ),
  
];

final itemlist = [
  const Items(
    name: 'Harry Potter and the Sorcerers Stone',
    price: 500,
    sellerName: 'Magic Books Co.',
    id: 'C1',
    url: 'https://content.time.com/time/2007/harry_potter/hp_books/sorce_stone.jpg',
  ),
  const Items(
    name: 'Pride and Prejudice',
    price: 750,
    sellerName: 'Classic Reads Store',
    id: 'C1',
    url: 'https://cdn.kobo.com/book-images/08ba5a67-f48d-420e-be8e-6de7a73b7d85/353/569/90/False/pride-prejudice-13.jpg',
  ),
  const Items(
    name: 'To the Lighthouse',
    price: 400,
    sellerName: 'Modernist Booksellers ',
    id: 'C1',
    url: 'https://cdn.kobo.com/book-images/ba8403c1-cce2-4049-bfd8-9872625631b1/353/569/90/False/to-the-lighthouse-160.jpg',
  ),
  const Items(
    name: '1984',
    price: 800,
    sellerName: 'Novel Haven',
    id: 'C1',
    url: 'https://cdn.kobo.com/book-images/698a1326-f8b7-4664-8f34-75f6633e816e/353/569/90/False/13xLRb-vHz2DfdgvhkjkHg.jpg',
  ),
  const Items(
    name: 'Headphones',
    price: 600,
    sellerName: 'Vishal',
    id: 'C2',
    url: 'https://rhizmall.pk/wp-content/uploads/2023/02/G601-Gaming-headphone-2.webp',
  ),
  const Items(
    name: 'Table',
    price: 1000,
    sellerName: 'Ritesh',
    id: 'C3',
    url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Folding_table.jpg/465px-Folding_table.jpg',
  ),
  const Items(
    name: 'Bicycle',
    price: 2500,
    sellerName: 'Atharva',
    id: 'C4',
    url:
        'https://staranddaisy.in/wp-content/uploads/2022/11/skillmax20in9123_mainblue.jpg',
  ),
];
