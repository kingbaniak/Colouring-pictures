clc;
% Załaduj zdjęcie

 img2p = imread("kobi.png");
 img = rgb2gray(img2p);
 %img=img2p;
 imwrite(img2p,"rgb.png");

subplot('Position',[0.1 0.6 0.4 0.4])
imshow(img);
binar = [0.2,0.8];

% Stwórz slidery
uicontrol('Style', 'text', 'String', 'Red','Position', [20 120 50 20])
redSlider = uicontrol('Style', 'slider', 'Min',0,'Max',1,'Value',0.5, 'Position', [20 100 120 20]);

uicontrol('Style', 'text', 'String', 'Green','Position', [20 80 50 20])
greenSlider = uicontrol('Style', 'slider','Min',0,'Max',1,'Value',0.5,'Position', [20 60 120 20]);

uicontrol('Style', 'text', 'String', 'Blue', 'Position', [20 40 50 20])
blueSlider = uicontrol('Style', 'slider', 'Min',0,'Max',1,'Value',0.5,'Position', [20 20 120 20]);

% Stwórz przyciski
checkbox = uicontrol('Style','checkbox','String','Imbinarize','Position',[450 20 100 20], 'Value', 0);

button1 = uicontrol('Style', 'pushbutton', 'String', 'Apply Jet colormap', 'Position', [200 10 200 40], 'Callback', {@applyJet, img,redSlider,greenSlider,blueSlider,checkbox,binar});
button2 = uicontrol('Style', 'pushbutton', 'String', 'Apply Parula colormap', 'Position', [200 50 200 40], 'Callback', {@applyParula, img,redSlider,greenSlider,blueSlider,checkbox,binar});
button3 = uicontrol('Style', 'pushbutton', 'String', 'Apply HSV colormap', 'Position', [200 90 200 40], 'Callback', {@applyHSV, img,redSlider,greenSlider,blueSlider,checkbox,binar});
button4 = uicontrol('Style', 'pushbutton', 'String', 'RESET', 'Position', [200 130 200 40], 'Callback', {@Reset, img,redSlider,greenSlider,blueSlider,checkbox,binar});
button = uicontrol('Style', 'pushbutton', 'String', 'Apply Color', 'Position', [20 140 120 20],'Callback', {@applyColor,redSlider,greenSlider,blueSlider});


subplot('Position',[0.55 0.6 0.4 0.4])
imshow(img)

function applyJet(~, ~, img,r,g,b,chb,bin)
r.Value = 0.5; g.Value = 0.5; b.Value = 0.5;
chbvalue = get(chb,'value');

if(chbvalue==1)
prog = 155;
B=img*0;
B=imbinarize(B);

for i=1:size(img,1)
    for j=1:size(img,2)
        if(img(i,j)>prog)    
            B(i,j)=1;
        end
    end
end

img = imadjust(img,bin);
else
end

cmap = jet(256);
    imgRGB = ind2rgb(img, cmap);
    imshow(imgRGB);
    imwrite(imgRGB,"rgb.png"); 
subplot('Position',[0.1 0.6 0.4 0.4])
imshow("rgb.png");
    
subplot('Position',[0.55 0.6 0.4 0.4]) 
imshow("rgb.png")
end

function applyParula(~, ~, img,r,g,b,chb,bin)
r.Value = 0.5; g.Value = 0.5; b.Value = 0.5;

chbvalue = get(chb,'value');

if(chbvalue==1)
prog = 155;
B=img*0;
B=imbinarize(B);

for i=1:size(img,1)
    for j=1:size(img,2)
        if(img(i,j)>prog)    
            B(i,j)=1;
        end
    end
end

img = imadjust(img,bin);
else
end

    cmap = parula(256);
    imgRGB = ind2rgb(img, cmap);
    imshow(imgRGB);
    imwrite(imgRGB,"rgb.png"); 
subplot('Position',[0.1 0.6 0.4 0.4])
imshow("rgb.png");
    
subplot('Position',[0.55 0.6 0.4 0.4]) 
imshow("rgb.png")
end

function applyHSV(~, ~, img,r,g,b,chb,bin)
r.Value = 0.5; g.Value = 0.5; b.Value = 0.5;
chbvalue = get(chb,'value');

if(chbvalue==1)
prog = 155;
B=img*0;
B=imbinarize(B);

for i=1:size(img,1)
    for j=1:size(img,2)
        if(img(i,j)>prog)    
            B(i,j)=1;
        end
    end
end

img = imadjust(img,bin);
else
end
    cmap = hsv(256);
    imgRGB = ind2rgb(img, cmap);
    imshow(imgRGB);
    imwrite(imgRGB,"rgb.png"); 
subplot('Position',[0.1 0.6 0.4 0.4])
imshow("rgb.png");
    
subplot('Position',[0.55 0.6 0.4 0.4]) 
imshow("rgb.png")
end

function Reset(~, ~, img,r,g,b,chb,bin)
r.Value = 0.5; g.Value = 0.5; b.Value = 0.5;
chbvalue = get(chb,'value');

if(chbvalue==1)
prog = 155;
B=img*0;
B=imbinarize(B);

for i=1:size(img,1)
    for j=1:size(img,2)
        if(img(i,j)>prog)    
            B(i,j)=1;
        end
    end
end

img = imadjust(img,bin);
else
end
imwrite(img,"rgb.png");
subplot('Position',[0.1 0.6 0.4 0.4])
imshow("rgb.png");
    
subplot('Position',[0.55 0.6 0.4 0.4]) 
imshow("rgb.png")
end

function applyColor(~,~,redSlider,greenSlider,blueSlider)

    % Zbierz wartości sliderów
    redIntensity = get(redSlider,'Value');
    greenIntensity = get(greenSlider,'Value');
    blueIntensity = get(blueSlider,'Value');

    % Dopasuj kanały RGB
    img=imread("rgb.png");
    imgOut = img;  % Kopia oryginalnego obrazu
    imgOut(:,:,1) = imgOut(:,:,1) * redIntensity;
    imgOut(:,:,2) = imgOut(:,:,2) * greenIntensity;
    imgOut(:,:,3) = imgOut(:,:,3) * blueIntensity;
    imshow(imgOut);

end

