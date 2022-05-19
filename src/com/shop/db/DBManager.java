package com.shop.db;

import com.shop.entities.Baskets;
import com.shop.entities.Categories;
import com.shop.entities.Items;
import com.shop.entities.Users;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

public class DBManager {

    private Connection connection;
    public void connect(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectshop", "root", "");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void addUser(Users user){
        try {
            PreparedStatement statement= connection.prepareStatement("insert  into users(id,email,password,full_name,role)" +
                    "values (null,?,?,?,?)");

            statement.setString(1, user.getEmail());
            statement.setString(2, user.getPassword());
            statement.setString(3,user.getFullNAme());
            statement.setInt(4,user.getRoleId());

            statement.executeUpdate();
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
    }


    public Users getUser(Users user){
        Users foundUser=null;
        try {
            PreparedStatement statement=connection.prepareStatement("select  * from users where email=?");
            statement.setString(1,user.getEmail());
            ResultSet resultSet=statement.executeQuery();
            if (resultSet.next()){
                Long id=resultSet.getLong("id");
                String fullName=resultSet.getString("full_name");
                int roleId=resultSet.getInt("role");
                String password=resultSet.getString("password");
                foundUser=new Users(id,user.getEmail(),password,fullName,roleId);
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return  foundUser;
    }


    public Users getUser(String token){
        Users foundUser=null;
        try {
            PreparedStatement statement= connection.prepareStatement("select  * from  users where SHA1(email,password)=?");
            statement.setString(1,token);
            ResultSet resultSet=statement.executeQuery();

            if (resultSet.next()){
                Long id = resultSet.getLong("id");
                String fullName = resultSet.getString("full_name");
                int roleId = resultSet.getInt("role");
                String password = resultSet.getString("password");
                String email = resultSet.getString("email");
                foundUser = new Users(id, email, password, fullName, roleId);
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return foundUser;
    }


    public void addCategories(Categories categories){
        try {
            PreparedStatement st =
                    connection.prepareStatement("INSERT INTO categories (id, name) VALUES (NULL, ?)");
            st.setString(1, categories.getName());
            st.executeUpdate();
            st.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }


    public ArrayList<Categories> getAllCategories(){
        ArrayList<Categories> categories = new ArrayList<>();
        try{
            PreparedStatement st
                    = connection.prepareStatement("SELECT * FROM categories");
            ResultSet res = st.executeQuery();
            while(res.next()){
                Long id = res.getLong("id");
                String name = res.getString("name");
                categories.add(new Categories(id, name));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return categories;
    }


    public void deleteCategory(Long id){
        try {
            PreparedStatement st =
                    connection.prepareStatement("DELETE FROM categories WHERE id = ?");
            st.setLong(1, id);
            st.executeUpdate();
            st.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }


    public void addItem(Items item){
        try {
            PreparedStatement st =
                    connection.prepareStatement("INSERT INTO items (id, name, category_id, price, amount, added_date) VALUES (NULL, ?,?,?,?, NOW())");
            st.setString(1, item.getName());
            st.setLong(2, item.getCategory().getId());
            st.setInt(3, item.getPrice());
            st.setInt(4, item.getAmount());
            st.executeUpdate();
            st.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }


    public ArrayList<Items> getAllItems(){
        ArrayList<Items> allItems=new ArrayList<>();
        try {
            PreparedStatement statement= connection.prepareStatement("select  i.id,i.name,i.price,i.category_id,i.added_date,i.amount,c.name category_name " +
                    "from items i left outer join categories c on c.id=i.category_id" );
            ResultSet resultSet=statement.executeQuery();
            while (resultSet.next()){
                Long id=resultSet.getLong("id");
                String name=resultSet.getString("name");
                int amount=resultSet.getInt("amount");
                int price=resultSet.getInt("price");
                String categoryName=resultSet.getString("category_name");
                Long categoryId=resultSet.getLong("category_id");
                Date addedDate=resultSet.getDate("added_date");
                allItems.add(new Items(id,name,price,amount,new Categories(categoryId,categoryName),addedDate));
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return allItems;
    }


    public void deleteItem(Long id){
        try {
            PreparedStatement st =
                    connection.prepareStatement("DELETE FROM items WHERE id = ?");
            st.setLong(1, id);
            st.executeUpdate();
            st.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }


    public Items getItem(Long id){
        Items item=null;
        try {
            PreparedStatement statement= connection.prepareStatement("select i.id,i.name,i.price,i.category_id,i.added_date,i.amount,c.name category_name " +
                    "from items i left outer join categories c on c.id=i.category_id where  i.id=?");
            statement.setLong(1,id);
            ResultSet resultSet=statement.executeQuery();

            if (resultSet.next()){
                String name=resultSet.getString("name");
                int amount=resultSet.getInt("amount");
                int price=resultSet.getInt("price");
                String categoryName=resultSet.getString("category_name");
                Long categoryId=resultSet.getLong("category_id");
                Date addedDate=resultSet.getDate("Added_date");

                item=new Items(id,name,price,amount,new Categories(categoryId,categoryName),addedDate);
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return  item;
    }

    public void saveItem(Items item){
        try {
            PreparedStatement st =
                    connection.prepareStatement("UPDATE items SET name = ?, price = ?, amount = ?, category_id = ? WHERE id = ? ");
            st.setString(1, item.getName());
            st.setInt(2, item.getPrice());
            st.setInt(3, item.getAmount());
            st.setLong(4,item.getCategory().getId());
            st.setLong(5, item.getId());

            st.executeUpdate();
            st.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }


    public void addBasket(Baskets basket){
        try {
            PreparedStatement st =
                    connection.prepareStatement("INSERT INTO baskets (id, user_id, item_id) VALUES (NULL, ?,?)");
            st.setLong(1, basket.getUser().getId());
            st.setLong(2, basket.getItem().getId());
            st.executeUpdate();
            st.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }


    public ArrayList<Baskets> getBasketByUser(Users user){
        ArrayList<Baskets> basket=new ArrayList<>();
        try {
            PreparedStatement statement= connection.prepareStatement("select b.id,b.user_id,b.item_id,i.name,i.price " +
                    "from baskets b left outer join items i on b.item_id=i.id where b.user_id=?");
            statement.setLong(1,user.getId());
            ResultSet resultSet=statement.executeQuery();
            while (resultSet.next()){
                Long id=resultSet.getLong("id");
                Long itemId=resultSet.getLong("item_id");
                String name=resultSet.getString("name");
                int price=resultSet.getInt("price");
                basket.add(new Baskets(id,user,new Items(itemId,name,price,0,null,null)));
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return  basket;
    }


    public void deletBasket(Long id){
        try {
            PreparedStatement st =
                    connection.prepareStatement("DELETE FROM baskets WHERE id = ?");

            st.setLong(1, id);
            st.executeUpdate();
            st.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }



}
