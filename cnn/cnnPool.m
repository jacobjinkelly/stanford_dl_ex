function pooledFeatures = cnnPool(poolDim, convolvedFeatures)
%cnnPool Pools the given convolved features
%
% Parameters:
%  poolDim - dimension of pooling region
%  convolvedFeatures - convolved features to pool (as given by cnnConvolve)
%                      convolvedFeatures(imageRow, imageCol, featureNum, imageNum)
%
% Returns:
%  pooledFeatures - matrix of pooled features in the form
%                   pooledFeatures(poolRow, poolCol, featureNum, imageNum)
%

numImages = size(convolvedFeatures, 4);
numFilters = size(convolvedFeatures, 3);
convolvedDim = size(convolvedFeatures, 1);

pooledFeatures = zeros(convolvedDim / poolDim, ...
        convolvedDim / poolDim, numFilters, numImages);

% Instructions:
%   Now pool the convolved features in regions of poolDim x poolDim,
%   to obtain the
%   (convolvedDim/poolDim) x (convolvedDim/poolDim) x numFeatures x numImages
%   matrix pooledFeatures, such that
%   pooledFeatures(poolRow, poolCol, featureNum, imageNum) is the
%   value of the featureNum feature for the imageNum image pooled over the
%   corresponding (poolRow, poolCol) pooling region.
%
%   Use mean pooling here.

for imageNum = 1:numImages:
  for filterNum: 1:numFilters:

    % Pooled features of image
    pooledImage = zeros(convolvedDim / poolDim, convolvedDim / poolDim);

    % Convolve with filter of all ones to do mean pooling
    filter = ones(poolDim, poolDim);

    % Obtain the image
    im = squeeze(images(:, :, imageNum));

    % Convolve
    pooledImage = conv2(im, filter, shape = "valid");

    % Subsampling and averaging
    % subsampling might require the downsample function, in the control package, which has to be install separately

    % Store before looping to next feature
    pooledFeatures(:, :, filterNum, imageNum) = pooledImage;
  end
end

end
