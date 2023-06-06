#pragma once

#include <unordered_map>
#include <algorithm>

constexpr UINT MaxIndex = 16;

template <typename D>
class AddressLookupTable
{
public:
	explicit AddressLookupTable(D *pDevice) : pDevice(pDevice) {}
	~AddressLookupTable()
	{
		ConstructorFlag = true;

		for (const auto& cache : g_map)
		{
			for (const auto& entry : cache)
			{
				entry.second->DeleteMe();
			}
		}
	}

	template <typename T>
	struct AddressCacheIndex { static constexpr UINT CacheIndex = 0; };
	template <>
	struct AddressCacheIndex<m_IDirect3D9Ex> { static constexpr UINT CacheIndex = 1; };
	template <>
	struct AddressCacheIndex<m_IDirect3DDevice9Ex> { static constexpr UINT CacheIndex = 2; };
	template <>
	struct AddressCacheIndex<m_IDirect3DCubeTexture9> { static constexpr UINT CacheIndex = 3; };
	template <>
	struct AddressCacheIndex<m_IDirect3DIndexBuffer9> { static constexpr UINT CacheIndex = 4; };
	template <>
	struct AddressCacheIndex<m_IDirect3DPixelShader9> { static constexpr UINT CacheIndex = 5; };
	template <>
	struct AddressCacheIndex<m_IDirect3DQuery9> { static constexpr UINT CacheIndex = 6; };
	template <>
	struct AddressCacheIndex<m_IDirect3DStateBlock9> { static constexpr UINT CacheIndex = 7; };
	template <>
	struct AddressCacheIndex<m_IDirect3DSurface9> { static constexpr UINT CacheIndex = 8; };
	template <>
	struct AddressCacheIndex<m_IDirect3DSwapChain9Ex> { static constexpr UINT CacheIndex = 9; };
	template <>
	struct AddressCacheIndex<m_IDirect3DTexture9> { static constexpr UINT CacheIndex = 10; };
	template <>
	struct AddressCacheIndex<m_IDirect3DVertexBuffer9> { static constexpr UINT CacheIndex = 11; };
	template <>
	struct AddressCacheIndex<m_IDirect3DVertexDeclaration9> { static constexpr UINT CacheIndex = 12; };
	template <>
	struct AddressCacheIndex<m_IDirect3DVertexShader9> { static constexpr UINT CacheIndex = 13; };
	template <>
	struct AddressCacheIndex<m_IDirect3DVolume9> { static constexpr UINT CacheIndex = 14; };
	template <>
	struct AddressCacheIndex<m_IDirect3DVolumeTexture9> { static constexpr UINT CacheIndex = 15; };

	m_IDirect3DSwapChain9Ex *CreateInterface(void *Proxy, REFIID riid)
	{
		return new m_IDirect3DSwapChain9Ex(static_cast<m_IDirect3DSwapChain9Ex*>(Proxy), pDevice, riid);
	}

	template <typename T>
	T *CreateInterface(void *Proxy)
	{
		return new T(static_cast<T *>(Proxy), pDevice);
	}

	template <typename T>
	T *FindAddress(void *Proxy, REFIID riid = IID_IUnknown)
	{
		if (!Proxy)
		{
			return nullptr;
		}

		constexpr UINT CacheIndex = AddressCacheIndex<T>::CacheIndex;
		auto it = g_map[CacheIndex].find(Proxy);

		if (it != std::end(g_map[CacheIndex]))
		{
			return static_cast<T *>(it->second);
		}

		if (riid == IID_IUnknown)
		{
			return CreateInterface<T>(Proxy);
		}
		else
		{
			return (T*)CreateInterface(Proxy, riid);
		}
	}

	template <typename T>
	void SaveAddress(T *Wrapper, void *Proxy)
	{
		constexpr UINT CacheIndex = AddressCacheIndex<T>::CacheIndex;
		if (Wrapper && Proxy)
		{
			g_map[CacheIndex][Proxy] = Wrapper;
		}
	}

	template <typename T>
	void DeleteAddress(T *Wrapper)
	{
		if (!Wrapper || ConstructorFlag)
		{
			return;
		}

		constexpr UINT CacheIndex = AddressCacheIndex<T>::CacheIndex;
		auto it = std::find_if(g_map[CacheIndex].begin(), g_map[CacheIndex].end(),
			[=](auto Map) -> bool { return Map.second == Wrapper; });

		if (it != std::end(g_map[CacheIndex]))
		{
			it = g_map[CacheIndex].erase(it);
		}
	}

private:
	bool ConstructorFlag = false;
	D *const pDevice;
	std::unordered_map<void*, class AddressLookupTableObject*> g_map[MaxIndex];
};

class AddressLookupTableObject
{
public:
	virtual ~AddressLookupTableObject() { }

	void DeleteMe()
	{
		delete this;
	}
};
