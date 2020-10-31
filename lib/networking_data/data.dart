import 'package:noticias/models/category_model.dart';

// Category data

List<CategoryModel> getCategoryList() {
  List<CategoryModel> categoryList = List<CategoryModel>();
  CategoryModel categoryModel = CategoryModel();

  //  1. Business
  categoryModel.categoryName = 'Business';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80';
  categoryList.add(categoryModel);

  categoryModel = CategoryModel();

  //  2. Entertainment
  categoryModel.categoryName = 'Entertainment';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80';
  categoryList.add(categoryModel);

  categoryModel = CategoryModel();

  //  3. Science
  categoryModel.categoryName = 'Science';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1507413245164-6160d8298b31?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80';
  categoryList.add(categoryModel);

  categoryModel = CategoryModel();

  //  4. Health
  categoryModel.categoryName = 'Health';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1532938911079-1b06ac7ceec7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=889&q=80';
  categoryList.add(categoryModel);

  categoryModel = CategoryModel();

  //  5. Sports
  categoryModel.categoryName = 'Sports';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1461896836934-ffe607ba8211?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80';
  categoryList.add(categoryModel);

  categoryModel = CategoryModel();

  //  6. Technology
  categoryModel.categoryName = 'Technology';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80';
  categoryList.add(categoryModel);

  categoryModel = CategoryModel();

  // 7. General
  categoryModel.categoryName = 'General';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1489533119213-66a5cd877091?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=751&q=80';
  categoryList.add(categoryModel);

  return categoryList;
}
