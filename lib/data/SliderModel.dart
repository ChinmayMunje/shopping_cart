class SliderModel{
  String image;
  String title;
  String description;

  SliderModel({this.title, this.description, this.image});

  void setImage(String getImage){
    image = getImage;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }
  void setDescription(String getDescription){
    description = getDescription;
  }

  String getImage(){
    return image;
  }

  String  getTitle(){
    return title;
  }
  String getDescription(){
    return description;
  }
}
List<SliderModel> getSlides(){
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setImage("images/slider2.png");
  sliderModel.setTitle("Copper Articles");
  sliderModel.setDescription("Intrested in buying Copper Handicrafts");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //1
  sliderModel.setImage("images/slider2.png");
  sliderModel.setTitle("Copper Articles");
  sliderModel.setDescription("Intrested in buying Copper Handicrafts");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //1
  sliderModel.setImage("images/slider2.png");
  sliderModel.setTitle("Copper Articles");
  sliderModel.setDescription("Intrested in buying Copper Handicrafts");
  slides.add(sliderModel);

  sliderModel = new SliderModel();
  return slides;
}