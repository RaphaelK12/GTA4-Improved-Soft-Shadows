#pragma once

class m_IDirect3DVertexBuffer9 : public IDirect3DVertexBuffer9, public AddressLookupTableObject
{
private:
	LPDIRECT3DVERTEXBUFFER9 ProxyInterface;
	m_IDirect3DDevice9Ex* m_pDeviceEx = nullptr;

public:
	m_IDirect3DVertexBuffer9(LPDIRECT3DVERTEXBUFFER9 pBuffer8, m_IDirect3DDevice9Ex* pDevice) : ProxyInterface(pBuffer8), m_pDeviceEx(pDevice)
	{
		pDevice->ProxyAddressLookupTable->SaveAddress(this, ProxyInterface);
	}
	~m_IDirect3DVertexBuffer9() {}

	LPDIRECT3DVERTEXBUFFER9 GetProxyInterface() { return ProxyInterface; }

	/*** IUnknown methods ***/
	STDMETHOD(QueryInterface)(THIS_ REFIID riid, void** ppvObj);
	STDMETHOD_(ULONG, AddRef)(THIS);
	STDMETHOD_(ULONG, Release)(THIS);

	/*** IDirect3DResource9 methods ***/
	STDMETHOD(GetDevice)(THIS_ IDirect3DDevice9** ppDevice);
	STDMETHOD(SetPrivateData)(THIS_ REFGUID refguid, CONST void* pData, DWORD SizeOfData, DWORD Flags);
	STDMETHOD(GetPrivateData)(THIS_ REFGUID refguid, void* pData, DWORD* pSizeOfData);
	STDMETHOD(FreePrivateData)(THIS_ REFGUID refguid);
	STDMETHOD_(DWORD, SetPriority)(THIS_ DWORD PriorityNew);
	STDMETHOD_(DWORD, GetPriority)(THIS);
	STDMETHOD_(void, PreLoad)(THIS);
	STDMETHOD_(D3DRESOURCETYPE, GetType)(THIS);
	STDMETHOD(Lock)(THIS_ UINT OffsetToLock, UINT SizeToLock, void** ppbData, DWORD Flags);
	STDMETHOD(Unlock)(THIS);
	STDMETHOD(GetDesc)(THIS_ D3DVERTEXBUFFER_DESC *pDesc);
};
