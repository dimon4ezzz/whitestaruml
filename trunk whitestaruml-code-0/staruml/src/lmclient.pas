unit lmclient;

interface

const
  LM_RESTRICTIVE        = $0001;
  LM_QUEUE              = $0002;
  LM_FAILSAFE           = $0003;
  LM_LENIENT            = $0004;
  LM_MANUAL_HEARTBEAT   = $0100;
  LM_RETRY_RESTRICTIVE  = $0200;
  LM_CHECK_BADDATE      = $0800;
  LM_FLEXLOCK           = $1000;

function license_new_job: Integer; cdecl; external 'lmclient.dll';
procedure license_free_job; cdecl; external 'lmclient.dll';
function license_checkout(policy: Integer; feature: PChar; version: PChar; path: PChar): Integer; cdecl; external 'lmclient.dll';
procedure license_checkin(feature: PChar); cdecl; external 'lmclient.dll';
function license_is_demo(feature: PChar): Integer; cdecl; external 'lmclient.dll';
function license_errstring: PChar; cdecl; external 'lmclient.dll';
procedure license_perror(err_string: PChar); cdecl; external 'lmclient.dll';

implementation

end.
