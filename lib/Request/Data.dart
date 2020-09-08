

import 'package:news_app/Model/CategoryModel.dart';


List<CategoryModel> getCategories(){
  List<CategoryModel> categories=new List<CategoryModel>();
  CategoryModel categoryModel=new CategoryModel();
  //1
  categoryModel.CategoryName="Business";
  categoryModel.ImageSource="https://images.unsplash.com/39/lIZrwvbeRuuzqOoWJUEn_Photoaday_CSD%20(1%20of%201)-5.jpg?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  categories.add(categoryModel);
  categoryModel =new CategoryModel();

  //2
  categoryModel = new CategoryModel();
  categoryModel.CategoryName = "Entertainment";
  categoryModel.ImageSource = "https://images.unsplash.com/photo-1514525253161-7a46d19cd819?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80";
  categories.add(categoryModel);

  //3
  categoryModel = new CategoryModel();
  categoryModel.CategoryName = "General";
  categoryModel.ImageSource = "https://images.unsplash.com/photo-1504805572947-34fad45aed93?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  categories.add(categoryModel);

  //4
  categoryModel = new CategoryModel();
  categoryModel.CategoryName = "Health";
  categoryModel.ImageSource = "https://images.unsplash.com/photo-1476480862126-209bfaa8edc8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  categories.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.CategoryName = "Science";
  categoryModel.ImageSource = "https://images.unsplash.com/photo-1580982172599-18d332f3528f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  categories.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.CategoryName = "Sports";
  categoryModel.ImageSource = "https://images.unsplash.com/photo-1507034589631-9433cc6bc453?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=631&q=80";
  categories.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.CategoryName = "Technology";
  categoryModel.ImageSource = "https://images.unsplash.com/photo-1480506132288-68f7705954bd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1093&q=80";
  categories.add(categoryModel);

  return categories;
}