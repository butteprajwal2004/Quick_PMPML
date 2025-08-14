<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" type="text/css" href="style.css">
<style>
.gallery {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  grid-gap: 10px;
}

.gallery-item {
  position: relative;
}

.gallery-item img {
  width: 100%;
  height: auto;
}

.overlay {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  opacity: 0;
  transition: opacity 0.5s;
  background-color: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: center;
}

.gallery-item:hover .overlay {
  opacity: 1;
}

.overlay h4 {
  color: white;
  font-size: 1.5rem;
  text-align: center;
  text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.5);
}
</style>
</head>
<body>
<center><h4>PHOTO GALLERY</h4></center>
<div class="gallery">
  <div class="gallery-item">
    <img src="image7.jpg" alt="Image 1">
    <div class="overlay">
      <h4>PMPML</h4>
    </div>
  </div>
  <div class="gallery-item">
    <img src="image6.jpg" alt="Image 6">
    <div class="overlay">
      <h4>PMPML</h4>
    </div>
  </div>
  <div class="gallery-item">
    <img src="image2.jpg" alt="Image 2">
    <div class="overlay">
      <h4>PMPML</h4>
    </div>
  </div>
  <div class="gallery-item">
    <img src="image3.jpg" alt="Image 3">
    <div class="overlay">
      <h4>PMPML</h4>
    </div>
  </div>
  <div class="gallery-item">
    <img src="Image1.jpg" alt="Image 8">
    <div class="overlay">
      <h4>PMPML</h4>
    </div>
  </div>
  <div class="gallery-item">
    <img src="image5.jpg" alt="Image 5">
    <div class="overlay">
      <h4>PMPML</h4>
    </div>
  </div>
  <div class="gallery-item">
    <img src="image9.jpg" alt="Image 9">
    <div class="overlay">
      <h4>PMPML</h4>
    </div>
  </div>
  <div class="gallery-item">
    <img src="image4.jpg" alt="Image 4">
    <div class="overlay">
      <h4>PMPML</h4>
    </div>
  </div>
  <div class="gallery-item">
    <img src="image10.jpg" alt="Image 10">
    <div class="overlay">
      <h4>PMPML</h4>
    </div>
  </div>
  <div class="gallery-item">
    <img src="image11.jpg" alt="Image 11">
    <div class="overlay">
      <h4>PMPML</h4>
    </div>
  </div>
  <div class="gallery-item">
    <img src="image12.jpg" alt="Image 12">
    <div class="overlay">
      <h4>PMPML</h4>
    </div>
  </div>
  <div class="gallery-item">
    <img src="image13.jpg" alt="Image 13">
    <div class="overlay">
      <h4>PMPML</h4>
    </div>
  </div>
  <div class="gallery-item">
    <img src="image14.jpg" alt="Image 14">
    <div class="overlay">
      <h4>PMPML</h4>
    </div>
  </div>
  <div class="gallery-item">
    <img src="image15.jpg" alt="Image 15">
    <div class="overlay">
      <h4>PMPML</h4>
    </div>
  </div>
  <div class="gallery-item">
    <img src="Image1 (1).jpg" alt="Image 7">
    <div class="overlay">
      <h4>PMPML</h4>
    </div>
  </div>
</div>
<center><h5><a href="Userhome.jsp">Back</a></h5></center>
</body>
</html>
