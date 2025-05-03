import React, { useState, useEffect } from 'react';
import axios from 'axios';

const API_URL = 'http://localhost:3000/api/v1';

const PhotoGrid = () => {
  const [photos, setPhotos] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchPhotos = async () => {
      try {
        const response = await axios.get(`${API_URL}/photos`);
        setPhotos(response.data);
        setLoading(false);
      } catch (err) {
        setError('Failed to fetch photos');
        setLoading(false);
      }
    };

    fetchPhotos();
  }, []);

  if (loading)
    return (
      <div className="flex justify-center items-center h-64">
        <div className="text-gray-600">Loading...</div>
      </div>
    );

  if (error) return <div className="text-red-600 text-center p-4">{error}</div>;

  return (
    <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
      {photos.map((photo) => (
        <div
          key={photo.id}
          className="bg-white rounded-lg shadow-sm overflow-hidden hover:shadow-md transition-shadow duration-200"
        >
          <img
            src={photo.image_url}
            alt={photo.title}
            className="w-full h-64 object-cover"
          />
          <div className="p-4">
            <h3 className="text-lg font-semibold text-gray-900 mb-2">
              {photo.title}
            </h3>
            {photo.description && (
              <p className="text-gray-600 mb-4">{photo.description}</p>
            )}
            <div className="space-y-1 text-sm text-gray-500">
              {photo.camera && <p>Camera: {photo.camera}</p>}
              {photo.lens && <p>Lens: {photo.lens}</p>}
              {photo.aperture && <p>Aperture: {photo.aperture}</p>}
              {photo.shutter_speed && (
                <p>Shutter Speed: {photo.shutter_speed}</p>
              )}
              {photo.iso && <p>ISO: {photo.iso}</p>}
            </div>
          </div>
        </div>
      ))}
    </div>
  );
};

export default PhotoGrid;
