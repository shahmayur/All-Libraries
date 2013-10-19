package com.cg.service;

import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;
//*********READ THE COMMENTS************///
//***********************************//
//These are the raw functions...please reply me with your actual 
//functions so that i can fix the final interface for everyone .
//please follow the naming convention
//MAKE THE NAMES MEANINGFUL
//THE FUNCTION SHOULD INDICATE A VERB...AN ACTION BEING PERFORMED
public interface ServiceInterface {
	boolean addUser();
	void activateUser(String user_email);
	boolean validateLogin(String user_id, String user_password);
	String encryptPassword(String user_password);
	String decryptPassword(String user_password);
	boolean logoutUser(String user_id);
	boolean changePassword(String user_id, String old_password, String new_password);
	String forgotPassword(String user_id);
	boolean validateSecurityQuestion(String user_id, String user_securityquestion, String user_securityanswer);
	boolean sendEmail(String user_email);
	boolean addProduct(Product productobj);
	boolean removeProduct(Map<Product,Integer> productmap);
	Collection<Product> showInventory();
	Collection showInventoryOfMerchant(String merchant_id);
	boolean validateMerchant(String merchant_id);
	boolean removeMerchant(String merchant_id);
	boolean createFeedback(String user_id, String id, String type, String feedback_content, Float rating);
	List<Feedback> readFeedback(String id);
	boolean deleteFeedback(String feedback_id);
	void searchProducts(String productsearchkey);
	boolean uploadImage(String product_id);
	Collection<Product> searchByCategory(String categorysearchkey);
	Collection<Product> searchByBrand(List<String> brandsearchkey);
	Collection<Product> searchByPrice(float minprice, float maxprice);
	Collection searchAllForAdmin(String globaladminsearchkey);
	Collection searchAllForUser(String globalusersearchkey);
	boolean addProductToWishList(String user_id, String product_id);
	void productView(String user_id);
	boolean deleteProduct(String userid, String product_id);
	Collection<Product> showSimilarProduct(String product_id);
	boolean validateRefund(String user_id);
	void generateInvoice(String order_id);
	Transaction getTransactionDetailsOfOrder(String order_id);
	boolean createCoupon(String merchant_id, String scheme_id, String scheme_name, String value, String type);
	boolean addCoupon(String merchant_id, String product_id, String scheme_id, Date start_date, Date end_date);
	boolean removeCoupon(String product_id, String merchant_id, String scheme_id);
	Collection<Offer> displayCoupon(String product_id);
	void inviteFriend(String email_id);
	void addRewardPoints(String user_id);
	Transaction getTransactionDetailsOfUser(String user_id);
	double getCartValue(String order_id);
	boolean doTransaction(String cart_value, String order_id);
	boolean doShipment(String order_id);
	void getShipmentStatus(String docpath);
	boolean setPromoMail(Date start_date, Date end_date, int frequency, Date starttime, Date endtime, int timefrequency);
	List<ProductToBeSold> calculateDiscount(ProductToBeSold product);//ProductToBeSold is a pojo to be created and used by praveen only...so others ignore this method.
	double caculateCartValue(List<ProductToBeSold> list); 
}
