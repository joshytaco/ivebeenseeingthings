import React from 'react';
import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faPlus, faUser } from '@fortawesome/free-solid-svg-icons';
import PhotoGrid from './components/PhotoGrid';
import UploadPhoto from './components/UploadPhoto';
import Login from './components/Login';
import Signup from './components/Signup';

function App() {
  return (
    <Router>
      <div className="min-h-screen bg-gray-50">
        <nav className="bg-white shadow-sm">
          <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div className="flex justify-between h-16 items-center">
              <Link
                to="/"
                className="text-2xl font-bold text-gray-900 hover:text-gray-700"
              >
                ivebeenseeingthings
              </Link>
              <div className="flex items-center space-x-4">
                <Link
                  to="/upload"
                  className="inline-flex items-center px-4 py-2 text-sm font-medium text-blue-600 hover:text-blue-700"
                >
                  <FontAwesomeIcon icon={faPlus} className="mr-2" />
                  Upload
                </Link>
                <Link
                  to="/login"
                  className="inline-flex items-center justify-center w-8 h-8 rounded-full bg-gray-200 hover:bg-gray-300 transition-colors"
                >
                  <FontAwesomeIcon icon={faUser} className="text-gray-600" />
                </Link>
              </div>
            </div>
          </div>
        </nav>

        <main className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
          <Routes>
            <Route path="/" element={<PhotoGrid />} />
            <Route path="/upload" element={<UploadPhoto />} />
            <Route path="/login" element={<Login />} />
            <Route path="/signup" element={<Signup />} />
          </Routes>
        </main>
      </div>
    </Router>
  );
}

export default App;
