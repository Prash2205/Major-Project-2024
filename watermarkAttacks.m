classdef watermarkAttacks
    methods(Static)
        
        % Noise Attack
        function noisyImage = applyNoise(image, density)
            % Add random noise to the image
            noisyImage = imnoise(image, 'gaussian', 0.5, density);
        end
       
        % Salt and Pepper Attack
        function saltPepperImage = applySaltPepper(image, density)
            % Apply salt and pepper noise to the image
            saltPepperImage = imnoise(image, 'salt & pepper', density);
        end

        %Speckle noise
        function specklenoise = applySpeckle(image, density)
            speckleImage = imnoise(image, 'speckle', density);
        end

        %% Sharpening attack strength
        function sharpenImageAttacked = applySharpen(image, density) 
            sharpenImageAttacked = imsharpen(image,'Amount', density);
        end

        %% Motion Blur Attack theta = 4 len = 7
        function motionImageAttacked = motionAttack(watermarked_image)
            h = fspecial('motion',7,4);
            motionImageAttacked = imfilter(watermarked_image,h,'replicate'); 
        end

        %% Average Filter Attack theta = 4 len = 7
        function averageImageAttacked = averageFilter(watermarked_image)
            h = fspecial('average',[3 3]);
            averageImageAttacked = imfilter(watermarked_image,h,'replicate');
        end
    end
end