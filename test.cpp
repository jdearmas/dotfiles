/* check if cfg.mode string has been modified */
bool access_mode_bool( )
{
     // allow only one thread to use this function at a time
     std::lock_guard<std::mutex> guard(mtx);

     // Check if Mode Is Different Then Original
     if ( mode_changed )
     {
         mode_changed = false;
         return true;
     }

     return false;
}

