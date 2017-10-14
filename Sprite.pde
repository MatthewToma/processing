class Sprite {
  public int nX, nY, nDx, nDy, nH, nW, nStance;
  String sFile, sFile2;
  PImage img, img1, img2;
  Sprite(String _sFile, String _sFile2, int _nX, int _nY, int _nH, int _nW) {
    nX = _nX;
    nY = _nY;
    nH = _nH;
    nW = _nW;
    sFile = _sFile;
    sFile2 = _sFile2;
    img1 = loadImage(sFile);
    img1.resize(nW, nH);
    img2 = loadImage(sFile2);
    img2.resize(nW, nH);
    img = img1;
  }
  public void updateDir(int _nDx, int _nDy) {
    nDx = _nDx;
    nDy = _nDy;      
  }
  public void changestance(int _nStance) {
    nStance=_nStance;
    if (nStance==1) {
      img=img1;
    }
    if (nStance==2) {
      img=img2;
    }
  }
  public void update() {
    nX +=nDx;
    nY +=nDy;
    image(img, nX, nY);
  }
  public void switchIt() {
    nDx *= -1;
    nDy *= -1;
  }
}